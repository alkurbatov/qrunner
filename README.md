# qrunner
Simple runner for applescripts.

# Dependencies
* Qt v5.8+
* qmake
* macdeployqt (for release build).

# Build
```bash
# Generate build routine.
$ qmake

# Debug build.
$ make debug

# Release build.
$ make release

# Make a .dmg image (release build).
$ make dmg
```

# Installation
```bash
# Put scripts to the home folder, e.g.:
$ mkdir ~/.qrunner
$ ln -s ~/work/src/github.com/alkurbatov/qrunner/scripts ~/.qrunner/scripts
```

## License

Copyright (c) 2017

Licensed under the [GPLv3 license](COPYING).
