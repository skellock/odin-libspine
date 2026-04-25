package raylib_example

import spine "../libspine"
import "core:strings"
import rl "vendor:raylib"
import rlgl "vendor:raylib/rlgl"

renderer: spine.SkeletonRenderer

vertex_buffer: [dynamic]RaylibVertex

RaylibVertex :: struct {
	position:   rl.Vector2,
	color:      rl.Color,
	tex_coords: rl.Vector2,
}

SpineDrawable :: struct {
	skeleton:             spine.Skeleton,
	skeleton_drawable:    spine.SkeletonDrawable,
	animation_state_data: spine.AnimationStateData,
	animation_state:      spine.AnimationState,
}

spine_drawable_nuke_buffers :: proc() {
	delete(vertex_buffer)
}

spine_drawable_create :: proc(spine_skeleton_data: ^SpineSkeletonData) -> SpineDrawable {
	if renderer == nil {
		renderer = spine.skeleton_renderer_create()
	}

	drawable := spine.skeleton_drawable_create(spine_skeleton_data.data)
	skeleton := spine.skeleton_drawable_get_skeleton(drawable)
	anim_state_data := spine.skeleton_drawable_get_animation_state_data(drawable)
	anim_state := spine.skeleton_drawable_get_animation_state(drawable)

	spine.animation_state_data_set_default_mix(anim_state_data, 0.2)
	spine.skeleton_setup_pose(skeleton)
	spine.animation_state_set_animation_1(anim_state, 0, "walk", true)

	return SpineDrawable {
		skeleton = skeleton,
		skeleton_drawable = drawable,
		animation_state_data = anim_state_data,
		animation_state = anim_state,
	}
}

spine_drawable_animate :: proc(
	self: ^SpineDrawable,
	animation_name: string,
	track: int = 0,
	loop: bool = true,
) {
	spine.animation_state_set_animation_1(
		self.animation_state,
		uint(track),
		strings.clone_to_cstring(animation_name, context.temp_allocator),
		loop,
	)
}

spine_drawable_animate_add :: proc(
	self: ^SpineDrawable,
	animation_name: string,
	track: int = 0,
	loop: bool = true,
	delay: f32 = 0,
) {
	spine.animation_state_add_animation_1(
		self.animation_state,
		uint(track),
		strings.clone_to_cstring(animation_name, context.temp_allocator),
		loop,
		delay,
	)
}

spine_drawable_update :: proc(self: ^SpineDrawable, dt: f32) {
	spine.skeleton_drawable_update(self.skeleton_drawable, dt)
}

spine_drawable_draw :: proc(self: ^SpineDrawable, position: rl.Vector2) {
	cmd := spine.skeleton_renderer_render(renderer, self.skeleton)

	for cmd != nil {
		clear_dynamic_array(&vertex_buffer)

		// grab the details of the render command
		num_vertices := spine.render_command_get_num_vertices(cmd)
		num_indices := spine.render_command_get_num_indices(cmd)
		positions := spine.render_command_get_positions(cmd)
		uvs := spine.render_command_get_uvs(cmd)
		colors := spine.render_command_get_colors(cmd)
		command_indices := spine.render_command_get_indices(cmd)
		texture := cast(^rl.Texture)spine.render_command_get_texture(cmd)
		blend_mode := spine.render_command_get_blend_mode(cmd)

		// fill the raylib vertices
		vertex: RaylibVertex
		for i in 0 ..< num_vertices {
			vertex.position.x = positions[i * 2]
			vertex.position.y = positions[i * 2 + 1]
			vertex.tex_coords.x = uvs[i * 2]
			vertex.tex_coords.y = uvs[i * 2 + 1]

			vertex.color.r = u8(colors[i] >> 24)
			vertex.color.g = u8(colors[i] >> 16)
			vertex.color.b = u8(colors[i] >> 08)
			vertex.color.a = u8(colors[i] >> 00)

			// TODO:
			//   make this not dynamic
			//   i did try, but, it didn't draw properly... my fault somehow
			append(&vertex_buffer, vertex)
		}

		// TODO:
		//   figure out if I'm rendering things backwards?
		//   should this be something I have to do here?
		rlgl.DisableBackfaceCulling()
		defer rlgl.EnableBackfaceCulling()

		rlgl.Begin(rlgl.TRIANGLES)
		defer rlgl.End()

		// TODO:
		//   should be setting based on the spine settings?
		//   why does .BILINEAR have rough edges? scaling?
		//   performance issues setting the texture in a hot draw loop?
		rl.SetTextureFilter(texture^, .POINT)

		// TODO:
		//   should be setting based on the spine settings?
		rl.SetTextureWrap(texture^, .CLAMP)

		// TODO:
		//   should pma come from spine somehow?
		set_blend_mode(blend_mode, false)
		defer rl.EndBlendMode()

		rlgl.SetTexture(texture.id)

		for idx in command_indices[0:num_indices] {
			v := vertex_buffer[idx]
			rlgl.Color4ub(v.color.r, v.color.g, v.color.b, v.color.a)
			rlgl.TexCoord2f(v.tex_coords[0], v.tex_coords[1])
			rlgl.Vertex2f(position.x + v.position[0], position.y + v.position[1])
		}

		// TODO:
		//   figure out why i have to do this?
		//   is this a performance hit?
		//   how do i track draw calls with raylib?
		rlgl.DrawRenderBatchActive()

		// grab the next render command
		cmd = spine.render_command_get_next(cmd)
	}
}

spine_drawable_destroy :: proc(self: ^SpineDrawable) {
	spine.skeleton_drawable_dispose(self.skeleton_drawable)
}

@(private = "file")
set_blend_mode :: #force_inline proc(blend_mode: spine.BlendMode, premultiplied_alpha: bool) {
	// set the blend mode
	if !premultiplied_alpha {
		switch blend_mode {
		case .Normal:
			rl.BeginBlendMode(.ALPHA)
		case .Additive:
			rl.BeginBlendMode(.ADDITIVE)
		case .Multiply:
			rl.BeginBlendMode(.MULTIPLIED)
		case .Screen:
			rl.BeginBlendMode(.ALPHA)
		}
	} else {
		rl.BeginBlendMode(.CUSTOM_SEPARATE)
		switch blend_mode {
		case .Normal:
			rlgl.SetBlendFactorsSeparate(
				rlgl.ONE,
				rlgl.ONE_MINUS_SRC_ALPHA,
				rlgl.ONE,
				rlgl.ONE_MINUS_SRC_ALPHA,
				rlgl.FUNC_ADD,
				rlgl.FUNC_ADD,
			)
		case .Additive:
			rlgl.SetBlendFactorsSeparate(
				rlgl.ONE,
				rlgl.ONE,
				rlgl.ONE,
				rlgl.ONE,
				rlgl.FUNC_ADD,
				rlgl.FUNC_ADD,
			)
		case .Multiply:
			rlgl.SetBlendFactorsSeparate(
				rlgl.DST_COLOR,
				rlgl.ONE_MINUS_SRC_ALPHA,
				rlgl.DST_ALPHA,
				rlgl.ONE_MINUS_SRC_ALPHA,
				rlgl.FUNC_ADD,
				rlgl.FUNC_ADD,
			)
		case .Screen:
			rlgl.SetBlendFactorsSeparate(
				rlgl.ONE,
				rlgl.ONE_MINUS_SRC_ALPHA,
				rlgl.ONE,
				rlgl.ONE_MINUS_SRC_ALPHA,
				rlgl.FUNC_ADD,
				rlgl.FUNC_ADD,
			)
		}
	}
}
