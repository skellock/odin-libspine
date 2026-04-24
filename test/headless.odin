package test

// based on:
// https://raw.githubusercontent.com/EsotericSoftware/spine-runtimes/refs/heads/4.3-beta/spine-c/tests/headless-test.c

import spine "../libspine"
import "base:runtime"
import "core:c"
import "core:fmt"
import "core:os"
import "core:strings"

headless_texture_loader :: proc "c" (path: cstring) -> rawptr {
	context = runtime.default_context() // if we needed
	return rawptr(nil)
}

header_texture_unloader :: proc "c" (texture: rawptr) {
}

indent_level := 0
INDENT := "  "

indent :: proc() {
	indent_level += 1
}

unindent :: proc() {
	indent_level -= 1
}

print_indent :: proc(format: string, args: ..any) {
	for i in 0 ..= indent_level {
		fmt.print(INDENT)
	}
	if len(args) == 0 {
		fmt.print(format)
	} else {
		fmt.printf(format, ..args)
	}
	fmt.printf("\n")
}

print_skeleton :: proc(skeleton: spine.Skeleton) {
	print_indent("SkeletonData {")
	indent()

	print_indent("       x: %.6f", spine.skeleton_get_x(skeleton))
	print_indent("       y: %.6f", spine.skeleton_get_y(skeleton))
	print_indent(" scale_x: %.6f", spine.skeleton_get_scale_x(skeleton))
	print_indent(" scale_y: %.6f", spine.skeleton_get_scale_y(skeleton))
	print_indent("    time: %.6f", spine.skeleton_get_time(skeleton))

	hip_bone := spine.skeleton_find_bone(skeleton, "hip")
	hip_bone_pose := spine.bone_get_pose(hip_bone)
	hip_x := spine.bone_pose_get_x(hip_bone_pose)
	hip_y := spine.bone_pose_get_y(hip_bone_pose)

	print_indent("   hip_x: %.6f", spine.bone_pose_get_x(hip_bone_pose))
	print_indent("   hip_y: %.6f", spine.bone_pose_get_y(hip_bone_pose))

	unindent()
	print_indent(" }")
}

print_skeleton_data :: proc(data: spine.SkeletonData) {
	print_indent("SkeletonData {")
	indent()

	print_indent("           name: \"%s\"", spine.skeleton_data_get_name(data))
	print_indent("        version: \"%s\"", spine.skeleton_data_get_version(data))
	print_indent("           hash: \"%s\"", spine.skeleton_data_get_hash(data))
	print_indent("              x: %.6f", spine.skeleton_data_get_x(data))
	print_indent("              y: %.6f", spine.skeleton_data_get_y(data))
	print_indent("          width: %.6f", spine.skeleton_data_get_width(data))
	print_indent("         height: %.6f", spine.skeleton_data_get_height(data))
	print_indent("reference scale: %.6f", spine.skeleton_data_get_reference_scale(data))
	print_indent("            fps: %.6f", spine.skeleton_data_get_fps(data))
	print_indent("    images_path: \"%s\"", spine.skeleton_data_get_images_path(data))
	print_indent("     audio_path: \"%s\"", spine.skeleton_data_get_audio_path(data))
	fmt.print("\n")
	slots_array := spine.skeleton_data_get_slots(data)
	slots_count := uint(spine.array_slot_data_size(slots_array))
	print_indent("Slots: %d", slots_count)

	bones_array := spine.skeleton_data_get_bones(data)
	bones_count := uint(spine.array_bone_data_size(bones_array))
	print_indent("Bones: %d", bones_count)

	anim_array := spine.skeleton_data_get_animations(data)
	anim_count := uint(spine.array_animation_size(anim_array))
	print_indent("Animations: %d", anim_count)

	if anim_count > 0 {
		indent()
		anims := spine.array_animation_buffer(anim_array)
		for i in 0 ..< anim_count {
			anim := anims[i]
			anim_name := spine.animation_get_name(anim)

			print_indent("%2d %s", i, anim_name)

		}
		unindent()
	}

	unindent()
	print_indent(" }")
}

main :: proc() {
	if len(os.args) < 4 {
		fmt.printf("Usage: headless <skeleton-path> <atlas-path> [animation-name]\n")
		os.exit(1)
	}

	// cmd line args
	skeleton_path := os.args[1]
	atlas_path := os.args[2]
	animation_name := os.args[3]

	// setting this will affect any upcoming loaders
	spine.bone_set_y_down(false)

	// load the atlas
	atlas_bytes, atlas_bytes_load_err := os.read_entire_file_from_path(
		atlas_path,
		context.temp_allocator,
	)
	if atlas_bytes_load_err != nil {
		fmt.printf("Unable to read file %s\n", atlas_path)
		os.exit(1)
	}
	atlas_dir, _ := os.split_path(atlas_path)
	sb_atlas := strings.builder_from_bytes(atlas_bytes)
	atlas_raw := strings.to_cstring(&sb_atlas)
	atlas_result := spine.atlas_load_callback(
		atlas_raw,
		strings.clone_to_cstring(atlas_dir, context.temp_allocator),
		headless_texture_loader,
		header_texture_unloader,
	)
	atlas_result_error := spine.atlas_result_get_error(atlas_result)
	if atlas_result_error != nil {
		fmt.printf("failed to load atlas: %s\n", atlas_result_error)
		spine.atlas_result_dispose(atlas_result)
		os.exit(1)
	}
	defer spine.atlas_result_dispose(atlas_result)
	atlas := spine.atlas_result_get_atlas(atlas_result)

	// load the skeleton
	skeleton_bytes, skeleton_load_err := os.read_entire_file_from_path(
		skeleton_path,
		context.temp_allocator,
	)
	if skeleton_load_err != nil {
		fmt.printf("Failed to read skeleton file\n")
		os.exit(1)
	}
	sb_skeleton := strings.builder_make()
	defer strings.builder_destroy(&sb_skeleton)
	strings.write_bytes(&sb_skeleton, skeleton_bytes)
	skeleton_raw := strings.to_cstring(&sb_skeleton)
	skeleton_data_result := spine.skeleton_data_load_json(
		atlas,
		skeleton_raw,
		strings.clone_to_cstring(skeleton_path, context.temp_allocator),
	)
	defer spine.skeleton_data_result_dispose(skeleton_data_result)
	skeleton_data := spine.skeleton_data_result_get_data(skeleton_data_result)
	if skeleton_data == nil {
		skeleton_data_error := spine.skeleton_data_result_get_error(skeleton_data_result)
		fmt.printf(
			"Failed to load skeleton (%d): %v\n",
			len(skeleton_data_error),
			skeleton_data_error,
		)
		os.exit(1)
	}

	print_skeleton_data(skeleton_data)
	fmt.print("\n")

	// create a drawable instance and grab it's skeleton, animation data, and animation state
	drawable := spine.skeleton_drawable_create(skeleton_data)
	defer spine.skeleton_drawable_dispose(drawable)
	skeleton := spine.skeleton_drawable_get_skeleton(drawable)
	anim_state_data := spine.skeleton_drawable_get_animation_state_data(drawable)
	anim_state := spine.skeleton_drawable_get_animation_state(drawable)
	spine.skeleton_set_position(skeleton, 400, 500)
	spine.skeleton_set_scale(skeleton, 0.5, 0.5)
	spine.skeleton_setup_pose(skeleton)

	// Print stuff about the skeleton like location, hip bone, etc.
	print_skeleton(skeleton)

	// set the animation if the user picked one
	if len(animation_name) > 0 {
		anim_name := strings.clone_to_cstring(animation_name, context.temp_allocator)
		animation := spine.skeleton_data_find_animation(skeleton_data, anim_name)

		if animation == nil {
			fmt.printf("Animation not found: %s\n", anim_name)
			os.exit(1)
		}

		spine.animation_state_set_animation_1(anim_state, 0, anim_name, true)

		// Tick into the future manually, since we don't have a game loop
		spine.skeleton_drawable_update(drawable, 1.0 / 60 * 1)

		// Print the new position
		print_indent("")
		print_skeleton(skeleton)
	}
}
