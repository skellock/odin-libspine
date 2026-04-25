package raylib_example

import spine "../libspine"
import "base:runtime"
import "core:log"
import "core:os"
import "core:strings"
import rl "vendor:raylib"

SpineAtlas :: struct {
	atlas:  spine.Atlas, // the atlas that can be passed to other spine functions
	handle: spine.AtlasResult, // used internally for holding the memory
}

spine_atlas_create :: proc(path: string) -> SpineAtlas {
	result := SpineAtlas{}

	atlas_bytes, atlas_bytes_load_err := os.read_entire_file_from_path(
		path,
		context.temp_allocator,
	)

	if atlas_bytes_load_err != nil {
		log.error("Unable to read atlas file: ", path)
	}

	atlas_dir, _ := os.split_path(path)
	sb := strings.builder_make()
	strings.write_bytes(&sb, atlas_bytes)
	atlas_raw := strings.to_cstring(&sb)
	defer strings.builder_destroy(&sb)

	handle := spine.atlas_load_callback(
		atlas_raw,
		strings.clone_to_cstring(atlas_dir, context.temp_allocator),
		raylib_texture_loader,
		raylib_texture_unloader,
	)

	atlas_result_error := spine.atlas_result_get_error(handle)

	if len(atlas_result_error) > 0 {
		log.error("failed to load atlas: ", atlas_result_error)
	}

	atlas := spine.atlas_result_get_atlas(handle)

	return SpineAtlas{handle = handle, atlas = atlas}
}

spine_atlas_destroy :: proc(self: ^SpineAtlas) {
	spine.atlas_result_dispose(self.handle)
}

// i have to hold this as a cache
textures: map[cstring]rl.Texture2D

raylib_texture_loader :: proc "c" (path: cstring) -> rawptr {
	context = runtime.default_context()
	if textures == nil {
		textures = make_map(map[cstring]rl.Texture2D)
	}

	// This needs to be cached because it's on the stack
	// which will nuke the address. These are tiny structures
	// anyway, not the real texture.
	textures[path] = rl.LoadTexture(path)

	return &textures[path]
}

raylib_texture_unloader :: proc "c" (texture: rawptr) {
	tex := cast(^rl.Texture2D)texture
	rl.UnloadTexture(tex^)
}
