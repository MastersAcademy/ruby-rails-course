puts "Ruby collections"


puts "4.Enumerable module mixin - Міксін додає методи до колекцій"




puts "1. Arrays -"

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
array_second.each do |n|
  puts n
end

puts""
as_lenght = array_second.length
puts"Length array_second = #{as_lenght} symbols"

puts""
array_second_ins = array_second.insert(0, "a", "b", "c", "d", "e")
as_lenght = array_second_ins.length
puts"After insertion length array_second = #{as_lenght} symbols"

puts"Array after insertion"
array_second_ins.each do |n|
puts n
end

puts""
oneElem = array_second_ins[1]
puts"Value one of  array element with index 1 = #{oneElem}"

puts""
rangeElem = array_second_ins[0..10]
puts"Value one of  array elements with range indexes from 0 to 10"

rangeElem.each do |n|
  puts n
end

puts ""
rangeElem = array_second_ins[2, 10]
puts"Value one of array 10 elements  with range begining index 2"

rangeElem.each do |n|
  puts n
end

puts ""
puts "Snake join array to string #{array_second_ins.join("_")}"

puts "2. Hashes "

first_hash = {gender: "female", age: 22, weight: 65}    #New hash

first_hash[:gender]                                     #Show one of values by key

first_hash[:height] = 175                               #Inserting new key and value to hash

first_hash[:height]                                     #Showing new inserted value by key

first_hash[:dif_info] = array_first                     #Inserting array as hash value

first_hash.fetch(:gender)                               #Fetch value by key

first_hash.fetch_values(:age, :weight)                  #Fetch values by several 

first_hash.each {|key, value| puts "#{key} = #{value}"}  #Showing all hashe keys and elements 

first_hash.length                                        #Showing hash lenght 

second_hash = first_hash.flatten(2)                     # Flattening hash to new array


second_hash.each {|key, value| puts "#{key}  #{value}"} #Showing flattened array elements 

puts "3. Sets"

require 'set'

st1 = Set.new ["a", "b", "c"]

st2 = [1, "a", "b", "c"].to_set

puts st1 == st2

st1.add(1)

puts st2 == st1
