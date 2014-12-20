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
Ruby 10th fib:   0.000000   0.000000   0.000000 (  0.000016)
Rust 10th fib:   0.000000   0.000000   0.000000 (  0.000014)
Ruby 20th fib:   0.000000   0.000000   0.000000 (  0.001155)
Rust 20th fib:   0.000000   0.000000   0.000000 (  0.000066)
Ruby 30th fib:   0.110000   0.000000   0.110000 (  0.107395)
Rust 30th fib:   0.000000   0.000000   0.000000 (  0.006144)
Ruby 40th fib:  12.800000   0.010000  12.810000 ( 12.816984)
Rust 40th fib:   0.750000   0.000000   0.750000 (  0.752246)
```