{ stdenv, fetchFromGitHub, rustPlatform, dash, bash }:

rustPlatform.buildRustPackage rec {
  name = "just-${version}";
  version = "0.3.3";

  src = fetchFromGitHub {
    owner = "casey";
    repo = "just";
    #rev = "v${version}";
    sha256 = "1jqlfxc91vj31br18lnj21srd0k6hh5grjsn97r94jl5x06mfcwz";
    rev = "87d02682bc2e485a8ed8553b4a0e5d1c2179cf9b";
  };

  depsSha256 = "0ibzk7wn50x935fxcryxj296szi04d47lk38wrq5k487nvsbcnn8";

  buildInputs = [ dash bash ];
  nativeBuildInputs = [ dash bash ];

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
