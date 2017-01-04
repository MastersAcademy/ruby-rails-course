require 'set'

p "Examples with array"
#create alphbet
alphabet = ('a'..'z').to_a

#return count of elements
p "#{alphabet.count}"

#return true if array include elements
p "#{alphabet.include?('b')}"

#return shuffled array
p "#{alphabet.shuffle!}"  

#return sort array
p "#{alphabet.sort!}" 

#return array by slice position
p "#{alphabet.slice(5, 10)}"

#clear array
p "#{alphabet.clear}"

p "======================================="

p "Examples with hash"

#create hash
week_days = { 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 5 => "Friday", 6 => "Saturday",  7 => "Sunday" }

#return all keys
p "#{week_days.keys}"

#return values of several keys
p "#{week_days.values_at(3, 1, 7)}"

#return inverted hash
p "#{week_days.invert}"

#return true if key present in hash
p "#{week_days.member?(2)}"
p "#{week_days.has_key?(3)}"

#return new multiply array with hash
p "#{week_days.to_a}"

p "======================================"

p "Examples Set"

my_set = Set.new ["one", 2, "three", "four", 5]

#return true if Set have at least one eql element
p "#{my_set.intersect? Set[5,"six", 10]}"

#return merge Set wirh added params 
clone_set = my_set.merge([2,4])
p "#{clone_set}"

#returns true if the set is a proper subset of the given set.
p "#{clone_set.proper_subset?(my_set)}"

#merges the elements of the given enumerable object to the set and returns self.
p "#{my_set.merge(clone_set)}"

#return array with Set
p "#{my_set.to_a}"













