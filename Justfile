# Just a task runner
# <https://github.com/casey/just>

# shows this help message
help:
    @just -l

# runs the `inline-intro` benchmark
inline-sort:
    cabal bench --enable-benchmarks --benchmark-options='--output bench-result/inline-sort.html' inline-sort

alias il := inline-sort

# runs the `sort-by` benchmark
sort-vs-sort-by:
    cabal bench --enable-benchmarks --benchmark-options='--output bench-result/sort-vs-sort-by.html' sort-vs-sort-by

alias so := sort-vs-sort-by

# runs the `nub` benchmark
nub:
    cabal bench --enable-benchmarks --benchmark-options='--output bench-result/nub.html' nub

# builds the library
build:
    cabal build

[private]
alias b := build

