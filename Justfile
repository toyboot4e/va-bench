# Just a task runner
# <https://github.com/casey/just>

# shows this help message
help:
    @just -l

# runs the `intro` benchmark
inline-effect:
    cabal bench --enable-benchmarks --benchmark-options='--output bench-result/inline-effect.html' inline-effect

alias il := inline-effect

# runs the `sort-by` benchmark
sort-vs-sort-by:
    cabal bench --enable-benchmarks --benchmark-options='--output bench-result/sort-vs-sort-by.html' sort-vs-sort-by

alias so := sort-vs-sort-by

# builds the library
build:
    cabal build

[private]
alias b := build

