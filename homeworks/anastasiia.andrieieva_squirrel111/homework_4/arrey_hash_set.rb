
puts "===============================ARRAY==============================="

@my_array = [1, 2, 3, 5, 4, 9, 82, 24, 68]
puts @my_array
puts "==================================================================="
puts "Iterate with each"
@my_array.each {|a| puts "Element : #{a}"}
puts "Size on array"
puts @my_array.size
puts "Show only odd elements:"
puts @my_array.select {|a| a.odd?}
puts "Map on array"
puts @my_array.select {|a| a.to_s != "b"}.join ","
puts "=========================HASH==========================="

h = { "a" => 33, "b" => 1067}

puts h
puts "============================================================="
puts "Show key and value or only key"
puts h.each {|key, value| puts "#{key} is #{value}" }
puts h.each_key {|key| puts key }
puts "Invertion on hash"
puts h.invert
puts "============================================================"

h2 = { "s" => 41, "q" => 67, "u" => 23, "i" => 765}

puts h2
puts "=============================================================="
puts "Size, delete on hash"
puts h2.size
puts h2.delete("u")
puts h2.size
puts "Merge on hashes"
puts h.merge!(h2)


puts "=======================SET=========================="

require 'set'

s = Set.new([4,1,7])
q = Set.new([3,9,8])
puts "Merge on sets"
u = s + q
puts  u.inspect
puts "Size on set"
puts u.size


