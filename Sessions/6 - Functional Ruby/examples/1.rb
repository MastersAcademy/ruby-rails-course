# Simple block example
def foo(a, b, &block)

  puts "a parameter:#{a}"
  puts "b parameter:#{b}"
  yield a, b if block_given?

end

puts "Simple block example"
puts "==================================================================="

foo(1, 2) do |a, b|

  puts "a from block #{a}"
  puts "b from block #{b}"

end

# foo(1, 2)

puts "Simple block example: one line"
puts "==================================================================="

foo(1, 2) { |a, b| puts "a from block #{a}"; puts "b from block #{b}" }
