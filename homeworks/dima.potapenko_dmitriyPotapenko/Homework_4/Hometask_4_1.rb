#Arrays
puts '#Arrays'
arr_1 = Array.new(5) {Array.new(1) {rand(-25..25)}}
arr_2= Array.new(5) {Array.new(1) {rand(-25..25)}}

#join
puts '-----'
puts '//join'
puts arr_1.join ', '
puts arr_2.join ', '
puts

#intersection
puts '-----'
puts '//intersection'
puts '*if there no results, run again*'
puts arr_1 & arr_2
puts

#compare
puts '-----'
puts '//compare'
comp = arr_1 | arr_2
puts comp.join ', '
puts

#sort
puts '-----'
puts '//sort'
puts arr_1.sort.join ', '
puts arr_2.sort.join ', '
puts

#Hashes
puts '#Hashes'

hash_1 ={ a: 10, b: 25, c: 50, d: 75, e: 100 }
hash_2 ={ f: 100, g: 150, h: 200, i: 250, l: 300 }
puts hash_1.values.join ", "
puts hash_2.values.join ", "

puts '-----'
puts '//each'
hash_2.each {|key, value| puts "#{key} is #{value}" }
puts

puts '-----'
puts '//replace'
hash_1.replace( "y" => 400, "z" => 500, "v" => 600, "w" => 700 ) 
hash_2.replace( "f" => 100, "g" => 150, "h" => 200, "i" => 250 )
puts hash_1
puts hash_2
puts

puts '-----'
puts '//delete - delete_if'
puts hash_1.values.join ', '
puts hash_2.values.join ', '
hash_1.delete("v")
hash_2.delete_if{|key, value| key >="h"}
puts hash_1.values.join ', '
puts hash_2.values.join ', '
puts

#Sets
require 'set'

puts '#Sets'
s1 = Set.new([1,2,3,4,5,6,7,8,9])
s2 = Set.new(['a','b','c','d','e','f','g','h','i'])
p s1
p s2
puts

puts '//add'
puts '-----'
s1.add(10)
p s1
puts 

puts '//merge'
puts '-----'
s1.merge(["11", "12"])
p s1
puts

puts '//array to set'
puts '-----'
arr_s = [1,2,3].to_set
p arr_s