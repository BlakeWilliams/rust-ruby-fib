#!/usr/bin/env ruby

require "ffi"
require "benchmark"

include Benchmark

class Fib
  module Rust
    extend FFI::Library
    ffi_lib "./ext/fib/target/release/libfib-ef056b8c7f5021aa.dylib"

    attach_function :fib, [:int], :size_t
    attach_function :slow_fib, [:int], :size_t
  end


  def self.slow_ruby_fib(n)
    if n <= 1
      n
    else
      slow_ruby_fib(n - 1) + slow_ruby_fib(n - 2)
    end
  end

  def self.ruby_fib(n, prev_fib = 1, next_fib = 1)
    if n < 3
      1
    elsif n == 3
      prev_fib + next_fib
    else
      ruby_fib(n - 1, next_fib, prev_fib + next_fib)
    end
  end

  def self.rust_fib(n)
    Fib::Rust::fib(n)
  end

  def self.slow_rust_fib(n)
    Fib::Rust::slow_fib(n)
  end
end

Benchmark.benchmark(CAPTION, 10, FORMAT) do |x|
  puts "Slow Fibs"
  x.report("Ruby 35th: ") { Fib.slow_ruby_fib(35) }
  x.report("Rust 35th: ") { Fib.slow_rust_fib(35) }
  puts
  x.report("Ruby 40th: ") { Fib.slow_ruby_fib(40) }
  x.report("Rust 40th: ") { Fib.slow_rust_fib(40) }
  puts

  puts "Fast Fibs"
  x.report("Ruby 40th: ") { Fib.ruby_fib(40) }
  x.report("Rust 40th: ") { Fib.rust_fib(40) }
  puts
  x.report("Ruby 90th: ") { Fib.ruby_fib(90) }
  x.report("Rust 90th: ") { Fib.rust_fib(90) }
end
