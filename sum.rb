require 'benchmark'

x = 50000
y = 10000

puts "Building arrays..."

inputs = []

for i in 1..x
  list = []
  for j in 1..y
    list << ((rand() * 1000000).to_i)
  end
  inputs << list
end

puts "Running benchmarks..."

Benchmark.bm do |x|
  x.report("Inject:") {
    inputs.each do |i|
      i.inject(&:+)
    end
  }
  x.report("Sum:") {
    inputs.each do |i|
      i.sum
    end
  }
end
