require 'set'
# examples with array

a=[1, 2, 3, 4, 5]
a.push(7, 10)
puts a
puts
a.insert(3, 'select')
puts a
puts
puts a.join('-')

# examples with Hashs
chelsea = {'1': "Asmir Begovic", '2': "ranislav Ivanovic", '3': "Marcos Alonso",
           '4': "Cesc Fàbregas", '7': "N'Golo Kanté", '8':	"Oscar", '10': "Eden Hazard",
           '11': "Pedro"}

reserve =  {'15': "Victor Moses",
            '19': "Diego Costa",
            '22': "Willian"}
puts
puts chelsea
puts
puts chelsea.values.join ";"
puts
chelsea.each {|item| puts "Item: #{item}"}

if chelsea.count < 11
  puts "Team have #{chelsea.count} players"
  puts "Add #{11 - chelsea.count}  players for a full team"
else
  puts "Your team is full"
end

# examples with Sets

set_chelsea = Set.new(chelsea)
set_reserve = Set.new(reserve)

if chelsea.count < 11
  puts (set_chelsea+set_reserve).inspect
else
  puts "Your team is full"
end

