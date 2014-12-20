#!/usr/bin/env ruby
#
require "ffi"
require "benchmark"

include Benchmark

class Fib
  module Rust
    extend FFI::Library

    ffi_lib "./ext/fib/target/release/libfib-ef056b8c7f5021aa.dylib"
    attach_function :fib, [:int], :int
  end


  def self.ruby_fib(n)
    if n <= 1
      n
    else
      ruby_fib(n - 1) + ruby_fib(n - 2)
    end
  end

  def self.rust_fib(n)
    Fib::Rust::fib(n)
  end
end

Benchmark.benchmark(CAPTION, 10, FORMAT) do |x|
  x.report("Ruby 10th fib: ") { Fib.ruby_fib(10) }
  x.report("Rust 10th fib: ") { Fib.rust_fib(10) }
  puts
  x.report("Ruby 20th fib: ") { Fib.ruby_fib(20) }
  x.report("Rust 20th fib: ") { Fib.rust_fib(20) }
  puts
  x.report("Ruby 30th fib: ") { Fib.ruby_fib(30) }
  x.report("Rust 30th fib: ") { Fib.rust_fib(30) }
  puts
  x.report("Ruby 40th fib: ") { Fib.ruby_fib(40) }
  x.report("Rust 40th fib: ") { Fib.rust_fib(40) }
end
