puts 'Home Work 4 (Массивы)'

#Arrays
puts '====='
puts '*Array'
arr = ["Welcome", "to", "ruby", "world"]
puts arr
puts

#pop
puts '====='
puts '*Pop'
arr.pop 
puts arr
puts


#push
puts '====='
puts '*push'
arr.push ["'Young padawan'"]
puts arr
puts

#length
puts '====='
puts '*length'
arr.length
puts arr.length
puts

#reverse
puts '====='
puts '*reverse'
arr.reverse
puts arr.reverse
puts

#Sets
require 'set'

puts '#Sets'
s1 = Set.new(["Do yo want to learn "])
p s1
puts

puts '*add'
puts '-----'
s1.add("ruby")
p s1
puts 
s1.add("?")
p s1
puts 

puts '*merge'
puts '-----'
s1.merge(["Or not?"])
p s1
puts

#Hashes
puts '#Hashes'
puts
puts "На какой день недели вы хотите узнать погоду?"
day = STDIN.gets.encode("UTF-8").chomp
day_weather = {
  "понедельник" => "малооблачно", 
  "вторник" => "значительная облсчность",
  "среда" => "ясно",
  "четверг" => "пасмурная погода со снегом",
  "пятница" => "пасмурная погода с дождем",
  "суббота" => "значительная облачность",
  "воскресенье" => "малооблачно"
}
if day_weather.has_key?(day)
  puts "Погода в этот день: #{day_weather[day]}"
else 
  puts "Такого дня не существует"
end