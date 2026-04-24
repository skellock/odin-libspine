package test

import spine "../libspine"
import "core:fmt"

main :: proc() {
	major := spine.major_version()
	minor := spine.minor_version()

	fmt.printf("major=%d minor=%d\n", major, minor)
}
