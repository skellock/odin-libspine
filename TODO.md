# TODOs

## Spine-related

- [x] binding generator
- [ ] verify all spine signatures
- [ ] convert the c comments to odin comments too
- [x] macOS static `libspine-c`
- [ ] macOS dynamic `libspine-c`
- [ ] Windows static `libspine-c`
- [ ] Windows dynamic `libspine-c`
- [ ] linux static `libspine-c`
- [ ] linux dynamic `libspine-c`
- [ ] Odin-esque higher-level wrapper for `libspine`?

## RayLib-related

- [x] [headless](https://raw.githubusercontent.com/EsotericSoftware/spine-runtimes/refs/heads/4.3-beta/spine-c/tests/headless-test.c) renderer example
- [x] [raylib](https://www.raylib.com) renderer example
- [ ] reconcile pre-multiplied alpha between the spine atlas and raylib texture
- [ ] reconcile texture filtering between the spine atlas and raylib texture
- [ ] reconcile texture wrap mode between the spine atlas and raylib texture
- [x] figure out why I have to disable backface culling for raylib
- [ ] don't use dynamic array for collecting vertices
- [x] manual bone manipulation example
- [ ] hook into spine events
