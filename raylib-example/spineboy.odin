package raylib_example

import spine "../libspine"
import rl "vendor:raylib"

SpineBoy :: struct {
	pos:                 rl.Vector2,
	aim:                 bool,
	spine_atlas:         SpineAtlas,
	spine_skeleton_data: SpineSkeletonData,
	spine_drawable:      SpineDrawable,
	crosshair_bone:      spine.Bone,
}

spine_boy_create :: proc() -> SpineBoy {
	atlas := spine_atlas_create("./samples/spineboy/export/spineboy.atlas")
	data := spine_skeleton_data_create("./samples/spineboy/export/spineboy-pro.json", &atlas)
	drawable := spine_drawable_create(&data)
	crosshair_bone := spine.skeleton_find_bone(drawable.skeleton, "crosshair")

	return SpineBoy {
		pos = {0, 0},
		spine_atlas = atlas,
		spine_skeleton_data = data,
		spine_drawable = drawable,
		crosshair_bone = crosshair_bone,
	}
}

spine_boy_aim :: proc(self: ^SpineBoy, enable: bool) {
	if enable {
		spine_drawable_animate(&self.spine_drawable, "aim", 1, true)
	} else {
		spine_drawable_animate_clear(&self.spine_drawable, 1)
	}
	self.aim = enable
}

spine_boy_fire :: proc(self: ^SpineBoy) {
	spine_drawable_animate(&self.spine_drawable, "shoot", 2, false)
}

spine_boy_update :: proc(self: ^SpineBoy, dt: f32, mouse_world_position: rl.Vector2 = {0, 0}) {
	MOVE_SPEED :: 500.0
	move_change := MOVE_SPEED * dt
	if rl.IsKeyDown(.LEFT) {
		self.pos.x -= move_change
	} else if rl.IsKeyDown(.RIGHT) {
		self.pos.x += move_change
	}
	if rl.IsKeyDown(.UP) {
		self.pos.y -= move_change
	} else if rl.IsKeyDown(.DOWN) {
		self.pos.y += move_change
	}

	// transfer the position to the skeleton
	spine.skeleton_set_position(self.spine_drawable.skeleton, self.pos.x, self.pos.y)

	// toggle aiming
	if rl.IsKeyPressed(.A) {
		spine_boy_aim(self, !self.aim)
	}

	// shoot if we're aiming
	if rl.IsMouseButtonPressed(.LEFT) && self.aim {
		spine_boy_fire(self)
	}

	if rl.IsKeyPressed(.I) {
		spine_drawable_animate(&self.spine_drawable, "idle")
	} else if rl.IsKeyPressed(.R) {
		spine_drawable_animate(&self.spine_drawable, "run")
	} else if rl.IsKeyPressed(.W) {
		spine_drawable_animate(&self.spine_drawable, "walk")
	} else if rl.IsKeyPressed(.D) {
		spine_drawable_animate(&self.spine_drawable, "death")
	} else if rl.IsKeyPressed(.H) {
		spine_drawable_animate(&self.spine_drawable, "hoverboard")
	} else if rl.IsKeyPressed(.SPACE) {
		spine_drawable_animate(&self.spine_drawable, "jump", loop = false)
		spine_drawable_animate_add(&self.spine_drawable, "run")
	} else if rl.IsKeyPressed(.P) {
		spine_drawable_animate(&self.spine_drawable, "portal", loop = false)
		spine_drawable_animate_add(&self.spine_drawable, "idle")
	}

	if self.aim {
		// When we aim, we're manipulating one of the skeleton's bones,
		// so we can't use the drawable's update function.

		skeleton := self.spine_drawable.skeleton
		anim_state := self.spine_drawable.animation_state

		// apply the animations
		spine.animation_state_update(anim_state, dt)
		spine.animation_state_apply(anim_state, skeleton)

		// get the current crosshair bone pose
		pose := spine.bone_get_applied_pose(self.crosshair_bone)

		// convert the mouse into the bone's local space
		local_mouse_x, local_mouse_y: f32
		spine.bone_pose_world_to_local(
			pose,
			mouse_world_position.x,
			mouse_world_position.y,
			&local_mouse_x,
			&local_mouse_y,
		)

		// offset the bone's position by local mouse position
		spine.bone_local_set_position(
			spine.bone_pose_cast_to_bone_local(pose),
			spine.bone_pose_get_x(pose) + local_mouse_x,
			spine.bone_pose_get_y(pose) + local_mouse_y,
		)

		// recalculate
		spine.skeleton_update_world_transform(skeleton, .Update)
	} else {
		// no bone manipulation means we can use this spine_drawable_update proc
		spine_drawable_update(&self.spine_drawable, dt)
	}

}

spine_boy_draw :: proc(self: ^SpineBoy) {
	spine_drawable_draw(&self.spine_drawable)
}

spine_boy_destroy :: proc(self: ^SpineBoy) {
	spine_atlas_destroy(&self.spine_atlas)
	spine_skeleton_data_destroy(&self.spine_skeleton_data)
}
