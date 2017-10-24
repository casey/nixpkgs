{ stdenv, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  name = "just-${version}";
  version = "0.3.3";

  src = fetchFromGitHub {
    owner = "casey";
    repo = "just";
    rev = "v${version}";
    sha256 = "0ajmhcyv35m0pikyp9181pm5im2gir4l06nhhrfbk0carl5nx9fa";
  };

  depsSha256 = "0ajmhcyv35m0pikyp9181pm5im2gir4l06nhhrfbk0carl5nx9fa";

  meta = with stdenv.lib; {
    description = "just is a handy way to save and run commands";
    longDescription = ''
    `just` is a handy way to save and run commands.

    Commands are stored in a file called `justfile` or `Justfile` with syntax inspired by `make`:

    ```make
    build:
    cc *.c -o main

    # test everything
    test-all: build
    ./test --all

    # run a specific test
    test TEST: build
    ./test --test {{TEST}}
    ```

    `just` produces detailed error messages and avoids `make`'s idiosyncrasies, so debugging a justfile is easier and less surprising than debugging a makefile.

    If you need help with `just` please feel free to open an issue. Feature requests and bug reports are also always welcome!
    '';
    homepage = "https://github.com/casey/just";
    license = stdenv.lib.licenses.mit;
    platforms = stdenv.lib.platforms.all;
    maintainer = [ maintainers.mehandes ];
  };
}
