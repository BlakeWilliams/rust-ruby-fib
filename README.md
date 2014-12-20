# Ruby & Rust Fib

A naive implementation of a `fib` function in both Ruby and Rust for very naive
benchmarking. This was mostly just to play around with using FFI in Ruby to link
Rust libraries.

## Running

To run the code you have to compile the Rust fib library in `ext/fib` with
`cargo build fib --release`.

If you don't have Cargo or Rust, install it from
[crates.io](https://crates.io/install) with the `rustup` script to get the
latest nightly.

After compiling the Rust dylib, you can run `./fib.rb` to run the code.


## Benchmark Results

It's not a serious benchmark and the results probably aren't worth much, but
here's what I got running Ruby `2.1.5p273` and Rust `rustc 0.13.0-nightly
(99d6956c3 2014-12-18 20:32:07 +0000)` using Ruby's
[Benchmark](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/benchmark/rdoc/Benchmark.html)
module.


```
                 user     system      total        real
Slow Fibs
Ruby 35th:   1.170000   0.000000   1.170000 (  1.169707)
Rust 35th:   0.070000   0.000000   0.070000 (  0.072348)

Ruby 40th:  13.150000   0.010000  13.160000 ( 13.167451)
Rust 40th:   0.780000   0.000000   0.780000 (  0.778428)

Fast Fibs
Ruby 40th:   0.000000   0.000000   0.000000 (  0.000007)
Rust 40th:   0.000000   0.000000   0.000000 (  0.000005)

Ruby 90th:   0.000000   0.000000   0.000000 (  0.000014)
Rust 90th:   0.000000   0.000000   0.000000 (  0.000003)
```
