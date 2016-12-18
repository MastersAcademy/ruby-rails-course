#Arrays_Car_Manufacturing

germany = ["BMW", "Volkswagen", "Mercedes", "Opel"]
japan = ["Nissan", "Mazda", "Toyota", "Infiniti"]

puts "The best cars in the world"
all_car = germany + japan
puts all_car.join ', '

japan.push("Lexus")
puts japan.to_s
puts "#{japan[4]}" + " - Люкс бренд."

germany = { 30000 => "BMW", 25000 => "Volkswagen", 40000 => "Mercedes", 20000 => "Opel"}
japan = { 25000 => "Nissan", 35000 => "Mazda", 28000 => "Toyota", 50000 => "Infiniti"}

puts "germany car"
germany.each {|key, value| puts "#{key}, $ price #{value}" }
puts "japan car"
japan.each {|key, value| puts "#{key}, $ price #{value}" }

puts

require 'set'

set_1 = Set.new([1, 3, 5, 7, 9, 11, 13])
puts set_1.inspect
