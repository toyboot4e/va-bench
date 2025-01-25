# Just a task runner
# <https://github.com/casey/just>

# shows this help message
help:
    @just -l

# runs the benchmark
bench:
    cabal bench --enable-benchmarks --benchmark-options='--output a.html'

[private]
alias be := bench

# builds the library
build:
    cabal build

[private]
alias b := build

