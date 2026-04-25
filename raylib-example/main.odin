package raylib_example

import spine "../libspine"
import "core:log"
import "core:mem"
import rl "vendor:raylib"

SCREEN_WIDTH := i32(1920)
SCREEN_HEIGHT := i32(1080)

tracking_allocator: mem.Tracking_Allocator
main :: proc() {
	context.logger = log.create_console_logger(.Debug)
	defer log.destroy_console_logger(context.logger)

	// setup memory tracking in debug mode
	when ODIN_DEBUG {
		mem.tracking_allocator_init(&tracking_allocator, context.allocator)
		context.allocator = mem.tracking_allocator(&tracking_allocator)

		defer {
			if len(tracking_allocator.allocation_map) == 0 {
				log.debug("No memory leaks detected 🎉.")
			} else {
				for _, value in tracking_allocator.allocation_map {
					log.errorf("%v: Leaked %v bytes\n", value.location, value.size)
				}
			}
			mem.tracking_allocator_destroy(&tracking_allocator)
		}
	}

	spine.bone_set_y_down(true)

	// setup raylib
	rl.SetConfigFlags({.MSAA_4X_HINT, .WINDOW_HIGHDPI})
	rl.SetTargetFPS(120)

	// setup window
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Odin + RayLib + Spine")
	defer rl.CloseWindow()

	DEFAULT_CAMERA_TARGET := rl.Vector2{0, 0}
	DEFAULT_CAMERA_OFFSET := rl.Vector2{cast(f32)SCREEN_WIDTH / 2.0, cast(f32)SCREEN_HEIGHT / 2.0}
	DEFAULT_CAMERA_ZOOM := f32(1)
	DEFAULT_CAMERA_ROTATION := f32(0)

	// setup the camera
	camera := rl.Camera2D {
		DEFAULT_CAMERA_OFFSET,
		DEFAULT_CAMERA_TARGET,
		DEFAULT_CAMERA_ROTATION,
		DEFAULT_CAMERA_ZOOM,
	}

	DEFAULT_SPINE_BOY_POS := rl.Vector2{-600, 400}

	spine_boy := spine_boy_create()
	spine_boy.pos = DEFAULT_SPINE_BOY_POS
	defer spine_boy_destroy(&spine_boy)

	defer spine_drawable_nuke_buffers()

	// main game loop
	for !rl.WindowShouldClose() {
		// free the temp allocator each frame
		defer mem.free_all(context.temp_allocator)

		// Where is our mouse in camera coordinates? Used for aiming.
		mouse_world_position := rl.GetScreenToWorld2D(rl.GetMousePosition(), camera)

		wheel := rl.GetMouseWheelMove()
		if wheel != 0 {
			camera.zoom += wheel * 0.005
			camera.zoom = max(min(camera.zoom, 2), 0.1)
		}

		// reset
		if rl.IsKeyDown(.ENTER) {
			camera = rl.Camera2D {
				DEFAULT_CAMERA_OFFSET,
				DEFAULT_CAMERA_TARGET,
				DEFAULT_CAMERA_ROTATION,
				DEFAULT_CAMERA_ZOOM,
			}
			spine_boy.pos = DEFAULT_SPINE_BOY_POS
		}

		// start drawing
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.DARKGRAY)

		spine_boy_update(&spine_boy, rl.GetFrameTime(), mouse_world_position)

		// draw everything within the camera scope
		{
			rl.BeginMode2D(camera)
			defer rl.EndMode2D()

			spine_boy_draw(&spine_boy)
		}

		// show raylib perf
		rl.DrawFPS(1, 1)
	}

}
