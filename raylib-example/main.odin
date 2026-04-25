package raylib_example

import "core:log"
import "core:mem"
import rl "vendor:raylib"

SCREEN_WIDTH := 1920
SCREEN_HEIGHT := 1080


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

	// setup raylib
	rl.SetConfigFlags({.MSAA_4X_HINT, .WINDOW_HIGHDPI})
	rl.SetTargetFPS(120)

	// setup window
	rl.InitWindow(i32(SCREEN_WIDTH), i32(SCREEN_HEIGHT), "Game")
	defer rl.CloseWindow()

	// setup the camera
	camera_target := rl.Vector2{0.0, 0.0}
	camera_offset := rl.Vector2{cast(f32)SCREEN_WIDTH / 2.0, cast(f32)SCREEN_HEIGHT / 2.0}
	camera_rotation := f32(0)
	camera_zoom := f32(1)
	camera := rl.Camera2D{camera_offset, camera_target, camera_rotation, camera_zoom}

	spine_boy := spine_boy_create()
	defer spine_boy_destroy(&spine_boy)

	defer spine_drawable_nuke_buffers()

	// main game loop
	for !rl.WindowShouldClose() {
		// free the temp allocator each frame
		defer mem.free_all(context.temp_allocator)

		// where is our mouse in camera coordinates?
		point := rl.GetScreenToWorld2D(rl.GetMousePosition(), camera)

		wheel := rl.GetMouseWheelMove()
		if wheel != 0 {
			camera.zoom += wheel * 0.01
			camera.zoom = max(min(camera.zoom, 2), 0.1)
		}

		// start drawing
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.DARKGRAY)

		spine_boy_update(&spine_boy, rl.GetFrameTime())

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
