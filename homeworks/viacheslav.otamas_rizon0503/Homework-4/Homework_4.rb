#
# Hash
#
years_old = { "Bob" => 40, "Slavik" => 50, "Gena" => 17, "Lesya" => 14 }

puts years_old

puts years_old.keys

puts years_old["Slavik"]

years_old["Slavik"] = 25
puts years_old["Slavik"]

puts years_old.delete("Katya") { |element| "#{element} not found" }

puts years_old.empty?

puts years_old.each_value { |value| puts value }

puts years_old.flatten

puts years_old.invert

#
# Array
#
ar = [569, "Slavik", -25.0, ["1", 2]]

puts ar

p ar.each { |element| puts element.to_s + " + any string" }

ar_another = [1, 2, ar]

p ar_another

p (ar_another + ar)

p (ar - ar_another)

p ar.take(3)

p ar.length

p ar << "ku"

p ar.delete_at(2)

#
# Set
#
require 'set'

p my_set = Set.new(["It", "is", "a", "fine", "day"])

p my_set.disjoint? Set["Alphabet"]

p my_set.size

p my_set.subset? Set["It"]

p my_set.to_a

p my_set + Set["Oops)"]

p my_set.merge Set["Oops)"]
