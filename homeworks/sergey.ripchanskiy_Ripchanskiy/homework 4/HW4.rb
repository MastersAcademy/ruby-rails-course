#Arrays_Dota_2_hero
radiant = ["Sven", "Tiny", "Luna", "Huskar", "Mirana"]
dire = ["Axe", "Pudje", "Abaddon", "Viper", "Terrorblade"]

#Sum
puts 'Все герои:'
all_hero = radiant + dire
puts all_hero.join ', '

#Add
dire[5] = "Berserker"
puts "#{dire[5]}" + ' - Новый герой'

#Join
puts radiant.join ', '
puts

#Hashes
radiant = { 70 => "Sven", 100 => "Tiny", 50 => "Luna", 65 => "Huskar", 75 => "Mirana"}
dire = { 70 => "Axe", 100 => "Pudje", 75 => "Abaddon", 65 => "Viper", 50 => "Terrorblade"}

#Sort
puts radiant.sort.to_s
puts dire.sort.to_s

#Each
puts 'Воины света'
radiant.each {|key, value| puts "#{key}, максимальный урон #{value}" }
puts 'Воины тьмы'
dire.each {|key, value| puts "#{key}, максимальный урон #{value}" }

puts
#Set
require 'set'

set_1 = Set.new([1, 3, 5, 7, 9, 11, 13])
puts set_1.inspect

