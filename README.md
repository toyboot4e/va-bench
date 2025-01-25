# va-bench

This repository is for benchmarking the [`vector-algorithms`](https://github.com/erikd/vector-algorithms) package, primarily for PRs.

## Setup

- Install GHC 9.8.4 with LLVM enabled

## How to run

- Run `cabal bench --enable-benchmarks --benchmark-options='--output a.html'`
  - If you have [`just`](https://github.com/casey/just) installed, run with `just bench` or `just be`.
- Open `a.html`

### How to use a local version of `vector-algorithms`

Modify `cabal.project` to point to your `vector-algorithms`. Or add a function to the library under `src/`.

