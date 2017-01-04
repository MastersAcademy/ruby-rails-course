require 'set'
require 'prime'

puts '============================================================'
puts '========================== ARRAY ==========================='
array_1 = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
array_2 = [17, 32, 14, 65, 31, 60, 91]
puts '========================== Group_by ==========================='
puts array_2.group_by { |i| i.prime? }
puts '========================== Sort ==========================='
print array_2.sort
puts
puts '========================== Join ==========================='
puts array_1.join('-')
puts
puts '========================== Array_to_Hash ==========================='
puts hash_1 = array_1.each_with_index.to_h
puts hash_2 = array_1.each_with_index.reverse_each.to_h
puts
puts '========================== SUM ==========================='
print array_1 + array_2
puts
puts '========================== Combination ==========================='
print array_2.combination(3).to_a
puts
puts '========================== Drop_while ==========================='
print array_2.drop_while { |i| i < 65 }
puts
puts '========================== Partition ==========================='
print array_2.partition { |v| v.odd? }
puts
puts '==========================================================='
puts '========================== HASH ==========================='
hash1 = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}
puts
puts '========================== reject ==========================='
puts hash1.reject { |k, v| v < 3 }
puts '========================== Shift ==========================='
puts hash1.shift
puts hash1
puts hash1.shift
puts hash1
puts '========================== Store ==========================='
puts hash1
hash1.store("e", 5)
puts hash1
puts '========================== Two_Arrays_to_hash ==========================='
hash2 = array_1.zip(array_2).to_h
puts hash2
puts hash2.has_key?('c')
puts hash2.has_value?(93)
puts '========================== Two_Arrays_to_hash ==========================='
hash3 = hash2.each_value { |value| print "#{value+=5} " }
puts hash3
puts '========================== Fetch ==========================='
puts hash2.fetch("a")
puts hash2.fetch("z") { |k| puts "key '#{k}' is missing" }
puts '==========================================================='
puts '========================== SET ==========================='
set_1 = Set.new([1, 15, 65, 71, 9, 111, 33])
set_2 = Set.new(Prime.first 10)
puts set_1.inspect
print set_2.inspect
puts
puts '========================== add to set ==========================='
puts set_1.add(3).inspect
puts '========================== sum of two sets ==========================='
sum_set = set_1 + set_2
puts sum_set.inspect
puts '========================== sort sum of two sets ==========================='
print sum_set.sort.to_set.inspect
puts
puts '========================== size ==========================='
puts sum_set.size
puts '========================== sum of all element ==========================='
puts sum_set.inject { |sum, n| sum + n }
puts '========================== select all even element from set==========================='
puts sum_set.select { |element| element.even? }
puts '========================== show band of set==========================='
print "#{sum_set.grep 20..70} \n"
print "#{sum_set.grep_v 20..70} \n"
print sum_set.first 5
puts
puts '========================== Sort Set ==========================='
set_3 = SortedSet.new([2, 1, 5, 6, 6, 4, 5, 3, 3, 3, 7, 0, 0, 91])
arr = []
set_3.each { |obj| arr << obj }
print "#{arr} \n"
