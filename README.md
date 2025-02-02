# va-bench

This repository is for benchmarking the [`vector-algorithms`](https://github.com/erikd/vector-algorithms) package, primarily for PRs.

## Setup

- Install GHC 9.8.4 with LLVM enabled

## How to run

### Benchmark 1. `inline-effect`

This benchmark demonstrates how `{-# INLINE #-}` sort is faster, specific to intro sort:

```sh
$ cabal bench --enable-benchmarks --benchmark-options='--output a.html' inline-effect
$ # open `a.html`
```

### Benchmark 2. `sort-vs-sort-by`

This benchmark demonstrates how `sort` in each module is slow:

```sh
$ cabal bench --enable-benchmarks --benchmark-options='--output b.html' sort-vs-sort-by
$ # open `b.html`
```

