require 'set'

# ARRAY

puts '---Array---'

#create an array
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 5, 4, 3, 2, 1, 21]
puts array.length
puts 'array:'
puts array.join ' '

puts 'delete first element'
array.shift
puts array.join ' '

puts 'add to the end of array elements from second part if they are not included in first part of array'
array.drop(array.length / 2).each { |element| array.push(element) unless array.take(array.length / 2).include?(element) }
puts array.join ' '

puts 'delete first maximal element and add it to the beginning of array'
max = array.max
array.delete_at(array.index(array.max))
array.unshift(max)
puts array.join ' '

puts 'delete first minimal element and add it to the end of array'
min = array.min
array.delete_at(array.index(array.min))
array.push(min)
puts array.join ' '

puts 'remove duplicate elements from an array'
array.uniq!
puts array.join ' '

puts 'multiply all elements by 10'
array.map! {|element| 10*element}
puts array.join ' '

puts 'delete all elements that are not divided by 3'
array.delete_if{ |element| element%3 != 0 }
puts array.join ' '

# HASH

puts '---Hash---'

#create hash
hash = {one: 1, two: 2, three: 3, four: 4, five: 5}
hash.each{|key, value| puts "key: #{key}\tvalue: #{value}"}

puts 'inverted hash'
hash.invert.each{|key, value| puts "key: #{key}\tvalue: #{value}"}

#default value
hash.default = 21
d = hash.default
hash.default_proc = proc do
  puts "Default value is #{d}"
end
hash[:zero]

puts 'sum of all values'
sum = 0
hash.each_value{|value| sum += value}
puts "#{hash.values.join ' + '} = #{sum}"

puts 'delete minimal value'
hash.delete(hash.key(hash.values.min))
puts hash.values.join ' '

puts 'hash merged with inverted hash'
hash.merge!(hash.invert)
hash.each{|key, value| puts "key: #{key}\tvalue: #{value}"}

puts 'delete all elements with symbol keys'
hash.delete_if{|key| key.class == Symbol}
hash.each{|key, value| puts "key: #{key}\tvalue: #{value}"}

puts 'make values equal to keys'
hash.each_key{|key| hash[key] = key}
hash.each{|key, value| puts "key: #{key}\tvalue: #{value}"}

puts 'multiply all keys and values'
product = 1
hash.each{|key, value| product *= key*value}
puts "#{hash.to_a.join ' * '} = #{product}"

# SET

puts '---Set---'

#create set
set = array.to_set
another_set = Set.new [10, 20, 30, 40, 50]
puts 'set:'
puts set.to_a.join ' '
puts 'another set'
puts another_set.to_a.join ' '

puts 'merge set with another set'
set.merge(another_set)
puts set.to_a.join ' '

puts 'add element to another set'
another_set.add(21)
puts another_set.to_a.join ' '

puts 'intersection of set and another set'
puts (set & another_set).to_a.join ' '

puts 'union of set and another set'
puts (set + another_set).to_a.join ' '

puts 'difference of set and another set'
puts (set - another_set).to_a.join ' '

puts 'divide all elements in set by 10'
set.collect!{|element| element/10}
puts set.to_a.join ' '

puts 'sort elements in the set'
puts set.sort.join ' '
