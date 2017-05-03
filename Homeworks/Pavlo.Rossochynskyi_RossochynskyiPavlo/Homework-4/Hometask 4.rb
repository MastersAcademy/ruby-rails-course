# Ruby collections
# Arrays
puts arr_a = [1 ,2 ,3 ,4 ,5]
arr_b = (7 .. 11).to_a
puts arr_a.size
puts  arr_b.sort.reverse
puts arr_a.include?(7)
arr_a.push(7)
puts arr_a.include?(7)
puts "==================================================================="

# Hashs
notes_hash = {do: 'C', re: 'D', mi: 'E', fa: 'F', sol: 'G', la: 'A', si: 'B'}
puts notes_hash
puts notes_hash.keys
puts "==================================================================="

# Sets
require 'set'
puts f = Set.new([1, 2, 3, 4, 5])
f.add('one')
f << 'two'
puts f.inspect
puts d = Set.new([2, 2, 3])
puts (d+f).inspect
puts "==================================================================="