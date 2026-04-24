# Odin Spine Runtime

[Odin](https://odin-lang.org) language bindings for the [Spine 4.3](https://esotericsoftware.com) C runtime. 
Used for crazy awesome 2d animations in games.


## Caveat Emptor / Momento Mori

🚧 This project is dangerously under construction. 🚧

Spine 4.3 is currently in beta, so consider this binding to be super duper beta.

In Spine 4.2, they had a real C library, but it became a bit much for them to maintain. 
In 4.3 they code-generated their C library from C++ which makes `libspine` have a really chatty API.


## How To Use

Copy the `libspine` directory into your own project. 

This comes with the binaries you need to include as a static library (currently macOS only right now). 
I've built the static libraries in release mode.

You don't need to run the convert.rb script.


## Convert

This script `convert.rb` will generate the Odin bindings. 
Esoteric has code generated their C bindings, so it's straight forward for us to codegen the Odin bindings from that.
It's written in Ruby. We love all languages around here.

You won't need to run this unless the Spine API updates.
The script will output into `libspine/libspine.odin`.

The script takes a single parameter; the path to the `spine/spine-runtimes` git repository on your computer.
You must have run their `spine-c/build.sh` script first as this program uses their output.

```sh
ruby convert.rb <PATH_TO_THE_YOUR_SPINE_RUNTIME_REPO>
# e.g. ruby convert.rb ~/tmp/spine-runtimes
```

## Contributing

Yes please!


## License

This project is MIT licensed.

Don't forget that the Spine runtime itself requires a license to use in your project. Very much worth it, imo.
See [their runtimes](https://github.com/esotericSoftware/spine-runtimes) for more details.
