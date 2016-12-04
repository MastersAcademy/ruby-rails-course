puts 'Hash'
first_school = { "first_class"  => '35 students',  "second_class" => '22 students', "third_class" => "14 students"}
second_school = { "first_class" => '12 students', "second_class" => '18 students'}
puts

puts 'join'
puts first_school.values.join ", "
puts second_school.values.join ", "

puts '-----'
puts 'each'
puts 'first_school'
first_school.each {|key, value| puts "#{key} is #{value}" }
puts 'second_school'
second_school.each {|key, value| puts "#{key} is #{value}" }
puts

puts 'merge'
first_school.merge!(second_school)
puts first_school.values.join ", "
puts second_school.values.join ", "
puts 

puts 'store'
second_school.store("third_class", '24 students')
puts first_school.values.join ", "
puts second_school.values.join ", "
puts '---------------------------------------------'

puts 'Array'
arr_1 = Array.new(10) {Array.new(1) {rand(-50..50)} }
arr_2 = Array.new(10) {Array.new(1) {rand(-50..50)} }
puts

puts 'join'
puts arr_1.join", "
puts arr_2.join", "
puts

puts 'Accessing Elements'
puts arr_1.first(5)
puts
puts arr_2.last(4)
puts

puts 'Adding Items to Arrays'
arr_1.push(rand(10))
arr_2 << rand(10)
puts arr_1.join", "
puts arr_2.join", "
puts