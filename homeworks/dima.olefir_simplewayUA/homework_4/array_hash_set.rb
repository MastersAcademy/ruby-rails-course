# Homework_4
require 'set'

  #Array
  number = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  puts number.join ","
  #method first adn last - 3 numbers
  puts number.first
  puts "last three numbers"
  puts number.last(3).join ","
  puts ""
  #added items
  puts "added new item"
  puts number.push(10).join ","
  puts ""
  playes = ["Messi", "Suarez", "Neymar", "Ronaldo", "Bale", "Benzema"]
  #method each
  playes.each { |list| puts list }
  #method count
  puts playes.count
  puts ""
  #map
  puts playes.map! {|star| star + " :super_star " }
  puts ""

  #Hash
  composition = { "Messi": 10, "Suarez": 9, "Neymar": 11 }
  puts composition
  puts composition.keys.join ", "
  puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"

  class Elclasico < Hash
    match = Elclasico.new { |hash, key| hash[key] = "Go play #{key}" }
    puts match["Ronaldo"]
    puts match["Bale"]
    puts match["Benzema"]
    puts match.keys.join ", "
    puts ""
  end
  
  #method assoc
  languages = {"programming_languages" => ["Ruby", "C", "C++", "objective C", "swift"],
                "colloquial" => ["English", "Ukrainian"] }
  puts languages.assoc("programming_languages")
  puts ""
  puts "keys:"
  puts languages.keys.join ", "
  puts ""

  #hash_each
  num = { "printer": 'hp1200', "monitor": 'dell 970' }
  num.each {|key, value| puts "#{key} is #{value}" }
  puts ""

  #Set
  a = Set.new([9,8,7])
  b = Set.new([7,6,5])
  c = Set.new([5,4,3])
  #search common elements, method intersect?
  puts a.intersect?(b)
  puts b.intersect?(c)
  puts a.intersect?(c)
  puts ""
  #method add
  obj = Set.new(["play", "ball", "football"])
  obj.add("trainer")
  obj.each{|list_two| puts list_two}
  puts ""
  #method to_set
  puts obj.object_id
  puts obj.to_set.object_id
  puts ""
