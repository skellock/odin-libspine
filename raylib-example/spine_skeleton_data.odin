package raylib_example

import spine "../libspine"
import "core:fmt"
import "core:log"
import "core:os"
import "core:strings"

SpineSkeletonData :: struct {
	data:   spine.SkeletonData,
	handle: spine.SkeletonDataResult,
}

spine_skeleton_data_create :: proc(path: string, atlas: ^SpineAtlas) -> SpineSkeletonData {
	skeleton_bytes, skeleton_load_err := os.read_entire_file_from_path(
		path,
		context.temp_allocator,
	)
	if skeleton_load_err != nil {
		log.error("Failed to read skeleton file: ", path)
	}

	sb_skeleton := strings.builder_make(context.temp_allocator)
	defer strings.builder_destroy(&sb_skeleton)

	strings.write_bytes(&sb_skeleton, skeleton_bytes)
	skeleton_raw := strings.to_cstring(&sb_skeleton)
	handle := spine.skeleton_data_load_json(
		atlas.atlas,
		skeleton_raw,
		strings.clone_to_cstring(path, context.temp_allocator),
	)

	data := spine.skeleton_data_result_get_data(handle)
	if data == nil {
		skeleton_data_error := spine.skeleton_data_result_get_error(handle)
		log.error("Failed to load skeleton %d", skeleton_data_error)
	}

	return SpineSkeletonData{data = data, handle = handle}
}

spine_skeleton_data_destroy :: proc(self: ^SpineSkeletonData) {
	spine.skeleton_data_result_dispose(self.handle)
}
