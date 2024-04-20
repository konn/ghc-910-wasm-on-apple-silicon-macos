# GHC WASM backend building for macOS

A simple earthly-based build system for GHC 9.10 (alpha) WASM backend, mainly designed to use with (Apple Silicon) macOS as a Host OS.

## Usage

1. Install [Earthly](https://earthly.dev).
2. Clone repository
3. Run `earthly build +build`
4. Take a coffee break (takes ~10mins with MacBook Pro with Apple M3 Pro)
5. :yum:

    ```bash
    $ wasmtime ./_build/hello.wasm
    Hello, WASM World from GHC 9.10!
    ```

## On IDEs

As of 2024-04-20, HLS doesn't compile with GHC 9.10 (even if almost all plugins are disabled and using `head.hackage`).
It might not be too hard to fix it, but I would rather use GHC 9.8 on the host.
The situation should be resolved once HLS supports GHC 9.10.

## TODOs

- Cabal-based projects
- Glue code for non-wasm GHC (JSFFI and `GHC.Wasm.Prim` is only available in WASM backend, not native one)
- Caching in Earthly

## Prior Works

@Lugendre [uses](https://github.com/Lugendre/earthly-haskell) Earthly to build static binary with Earthly (and utilises caching mechanism of Earthly):

https://github.com/Lugendre/earthly-haskell