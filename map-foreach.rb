require 'benchmark'

def perform x
  x ** 2
end

range = (1..100000000).to_a

Benchmark.bm do |x|
  x.report("     Map:") {
    range.map {|i| perform i}
  }
  x.report("For Each:") {
    range.each {|i| i = perform(i)}
  }
end
