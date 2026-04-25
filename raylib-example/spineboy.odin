package raylib_example

import rl "vendor:raylib"

SpineBoy :: struct {
	spine_atlas:         SpineAtlas,
	spine_skeleton_data: SpineSkeletonData,
	spine_drawable:      SpineDrawable,
}

spine_boy_create :: proc() -> SpineBoy {
	atlas := spine_atlas_create("./samples/spineboy/export/spineboy.atlas")
	data := spine_skeleton_data_create("./samples/spineboy/export/spineboy-pro.json", &atlas)
	drawable := spine_drawable_create(&data)

	return SpineBoy{spine_atlas = atlas, spine_skeleton_data = data, spine_drawable = drawable}
}

spine_boy_update :: proc(self: ^SpineBoy, dt: f32) {
	spine_drawable_update(&self.spine_drawable, dt)

	if rl.IsKeyPressed(.I) {
		spine_drawable_animate(&self.spine_drawable, "idle")
	} else if rl.IsKeyPressed(.R) {
		spine_drawable_animate(&self.spine_drawable, "run")
	} else if rl.IsKeyPressed(.W) {
		spine_drawable_animate(&self.spine_drawable, "walk")
	} else if rl.IsKeyPressed(.D) {
		spine_drawable_animate(&self.spine_drawable, "death")
	} else if rl.IsKeyPressed(.H) {
		spine_drawable_animate(&self.spine_drawable, "hover")
	} else if rl.IsKeyPressed(.SPACE) {
		spine_drawable_animate(&self.spine_drawable, "jump", loop = false)
		spine_drawable_animate_add(&self.spine_drawable, "run")
	} else if rl.IsKeyPressed(.P) {
		spine_drawable_animate(&self.spine_drawable, "portal", loop = false)
		spine_drawable_animate_add(&self.spine_drawable, "idle")
	}
}

spine_boy_draw :: proc(self: ^SpineBoy) {
	spine_drawable_draw(&self.spine_drawable)
}

spine_boy_destroy :: proc(self: ^SpineBoy) {
	spine_atlas_destroy(&self.spine_atlas)
	spine_skeleton_data_destroy(&self.spine_skeleton_data)
}
