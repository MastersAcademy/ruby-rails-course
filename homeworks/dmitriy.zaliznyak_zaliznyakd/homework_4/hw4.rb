puts "================Array-Hash-Set==============="

require 'set'

#Arrays
puts "====Array===="

toys = ["car", "ball", "rails", "doll", "mozaika"]

puts toys.join ", "
puts toys.each{|name| puts name}
puts toys.last(2)
puts toys[1..2]
puts toys[0..2].join ", "
puts toys.fetch(-2)
toys.find{|toy| puts toy == "ball"}
puts toys.grep(/ll/) {|toy| toy}
puts toys.count

#+++++++++++++++++++++++++++++++++++++++
puts ""
puts "====Hash===="

game = {"car":3, "doll":7, "ball":10}
puts game
puts "A girl for game needs:"
puts game.keys.join " and a "


h = {"classmates" => ["Vasya", "Ira", "Petya"],
      "games" => ["soccer", "ping-pong", "snowballs"] }
puts h.assoc("games")

sounds = {"cat": 'miau', "dog": 'wooff', "cow": 'moo'}
sounds.each {|key, value| puts "#{key} souds like #{value}"}
puts ""

#+++++++++++++++++++++++++++++++++++++++
puts ""
puts "====Set===="

one = Set.new([1, 2, 3, 4])
two = Set.new(['car', 'rails', 'balls'])

one.add("doll")
one.each{|n| puts n}

puts two.object_id
puts two.to_set.object_id

p one | two

#+++++++++++++++++++++++++++++++++++++++
