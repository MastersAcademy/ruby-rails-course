require 'set'

#Array

array = [ 2, 14, 90, 82, 18, 44, 32, 22, 21, 100, 32,
          4, 14, 93, 88, 37, 21, 14, 32, 18, 115, 20 ]

puts '============ Array ==================='
puts array

puts "\nShow all odd elements:"
puts array.select {|a| a.odd?}

puts "\nElements divisible by 3:"
puts array.select {|a| a%3 == 0}

puts "\nDelete all repeating elements:"
puts array.uniq

puts "\nEnglish letters with order number from array:"
letters = array.each.select {|a| (a.between?('A'.ord,'Z'.ord) or a.between?('a'.ord,'z'.ord))}
puts letters.map{|a| a.chr}

puts "\nSwap min and max:"
max_i = array.index(array.max)
min_i = array.index(array.min)
array[min_i], array[max_i] = array[max_i], array[min_i]
puts array

puts "\nFind 3 min elements:"
puts array.sort[0..2]
puts "\n"

#Hash

first_hsh = { 'Acolyte' => 10, 'Phalanx' => 13, 'Carnifex' => 20 }
second_hsh = { 'Talon' => 26, 'Scorpion' => 200, 'Phaeston' => 120 }

puts '============ Hash ==================='
puts first_hsh
puts second_hsh

puts "\nMerge two hashes:"
puts hsh = first_hsh.merge(second_hsh)

puts "\nA new array as flattening of the hash:"
puts first_hsh.flatten

puts "\nDelete elements:"
puts hsh.delete_if { |key, value| value < 14 }

puts "\nInvert values and keys:"
puts hsh.invert

puts "\nDelete all elements and check is the hash is empty:"
puts hsh.clear
puts hsh.empty? ? 'Hash is empty' : 'Hash is not empty'
puts "\n"

#Set

puts '============ Set ==================='
p set_one = Set.new([ 'apple', 12, 'pear', [2, 'x'], Time.now.asctime ])
p set_two = Set.new([ 'apple', 12, '2', 'x'])

puts "\nUnion of sets:"
p set_one | set_two

puts "\nDisjunctive union of sets:"
p set_one ^ set_two

puts "\nIntersection of sets:"
p set_one & set_two

puts "\nAdd to set:"
sleep(1)
p set_one << Time.now.asctime

puts "\nNew set from array:"
p s = [16, 3, 9, 2, 7, 11, 12].to_set

puts "\nDivide the set into a set of subsets (even and odd numbers):"
p sets = s.divide { |s| s % 2 == 0 }
