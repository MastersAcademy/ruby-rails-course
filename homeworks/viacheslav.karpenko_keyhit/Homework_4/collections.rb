puts "Ruby collections"

puts "1. Arrays"

array_first = [1, 4, 5, 3, 2, "a", "d", "c", "g", "f", "b"]      #Manualy array creatinon

puts""
puts "Same iterations but differ syntax"

puts "single line"
array_first.each{|n| puts n}                                     #single line syntax for iteration array

puts "multi line"
array_first.each do |n|                                          # multy line syntax for iteration array
  puts n
end

puts""
puts "Using sort method and creating array_second"
array_second = array_first.sort { |x,y| x.to_s <=> y.to_s }
puts array_second

puts""
as_lenght = array_second.size
puts"Length array_second = #{as_lenght} symbols"

puts""
array_second_ins = array_second.insert(0, "a", "b", "c", "d", "e")
as_lenght = array_second_ins.size
puts"After insertion length array_second = #{as_lenght} symbols"

puts"Array after insertion"
puts array_second_ins

puts""
one_elem = array_second_ins[1]
puts"Value one of  array element with index 1 = #{one_elem}"

puts""
range_elem = array_second_ins[0..10]
puts"Values one of  array elements with range indexes from 0 to 10"
puts range_elem

puts ""
range_elem = array_second_ins[2, 10]
puts"Values one of array 10 elements  with range begining index 2"
puts range_elem

puts ""
puts "Snake join array to string #{array_second_ins.join("_")}"

puts "2. Hashes"

first_hash = {gender: "female", age: 22, weight: 65}    #New hash

first_hash[:gender]                                     #Show one of values by key

first_hash[:height] = 175                               #Inserting new key and value to hash

first_hash[:height]                                     #Showing new inserted value by key

first_hash[:dif_info] = array_first                     #Inserting array as hash value

first_hash.fetch(:gender)                               #Fetch value by key

first_hash.fetch_values(:age, :weight)                  #Fetch values by several 

first_hash.each {|key, value| puts "#{key} = #{value}"}  #Showing all hashe keys and elements 

first_hash.size                                          #Showing hash lenght 

second_hash = first_hash.flatten(2)                      # Flattening hash to new array


second_hash.each {|key, value| puts "#{key}  #{value}"} #Showing flattened array elements 

puts "3. Sets"

require 'set'

st1 = Set.new ["a", "b", "c"]

st2 = [1, "a", "b", "c"].to_set

puts st1 == st2

st1.add(1)

puts st2 == st1
