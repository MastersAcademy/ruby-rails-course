require 'set'
p s1 = Set.new([0, 1])
puts "p s1 = Set.new([1, 2])"
p s1.merge([12, 13, 55])
p s2 = Set.new([2, 2.0, "zoo", 21.21])
p (s1 + s2).length
p (s1 - s2).length
p s1.length
p s2.size
p s1 + s2
p s2 - s1
s1.delete_if {|b| b == 3}
p s1
p s1.class
p s1.to_a.class
p s1
p s1.reject! { |e| e<10  }
p s1.class
p s1.map
