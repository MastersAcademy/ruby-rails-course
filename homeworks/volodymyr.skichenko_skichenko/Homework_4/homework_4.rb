require 'set'

#Hash
puts "---Class Hash---"

arr1 = {a: 1, b: "Dog", c: 17, d: 123, e: 'z'}
arr2 = {w: 0, x: 10, y: 100, z: 101}

puts "arr1 = #{arr1}"
puts "arr2 = #{arr2}"

puts "1.) arr1.emty? = #{arr1.emty?}"
puts "2.) arr1.has_key?("c") = #{arr1.has_key? ("c")}"
puts "3.) arr1.has_value?("Dog") = #{arr1.has_value? ("Dog")}"
puts "4.) arr.keys = #{arr1.keys}"
puts "5.) arr1.merge!(arr2) = #{arr1.merge!(arr2)}"
puts "6.) arr1.select {|k,v| v > 100} = #{arr1.select {|k,v| v > 100}}"

#Array
puts "---Class Array---"

arr1 = ['a', 'b', 'c', 'd', 'e', 'f']
arr2 = [0, 1, 23, 45, 67, 89]

puts "arr1=#{arr1}"
puts "arr2=#{arr2}"

puts "1.) arr1 + arr2 = #{arr1 + arr2}"
puts "2.) arr1.join = #{arr1.join}"
puts "3.) arr2.length = #{arr2.length}"
puts "4.) arr2.reverse = #{arr2.reverse}"
puts "5.) arr1.push('g') = #{arr1.push('g')}"
puts "6.) arr2.map{ |x| x*0 } = #{arr2.map{|x|x*0}}"

#Set
puts "---Class Set---"

s1 = Set.new [10, 20, 30]
s2 = Set.new [20, 30]
puts s1
puts s2

puts "1.) s1.merge!(s2) = #{s1.merge(s2)}"
puts "2.) s1.subset? s2 = #{s1.subset? s2}"
puts "3.) s1.intersect? s2 = #{s1.intersect? s2}"
puts "4.) s1.disjoint? s2 = #{s1.disjoint? s2}"
puts "5.)  = #{}"
puts "6.)  = #{}"
