require 'set'

# Array
puts " "
puts "============Work with array=============="
state = ['Cherkasskaya', 'Chernovitskaya', 'Krym', 'Donetskaya', 'Dnepropetrovskaya', 'Ivano-Frankovskaya',
         'Kirovogradskaya', 'Khersonskaya']
puts state.join (", ")
puts "================"
#method fetch
puts state.fetch(4)
#Add items to array
state.push('Odesskaya')
puts state.include?('Odesskaya')
#Returns a new array containing self‘s elements in reverse order
puts '--------------------------'
str = "Ukraine is "
state.reverse_each { |item| str += "#{item}, " }
puts str
#Creates a new array containing the values returned by the block
puts state.map { |a| a + "!" }

# Hash
puts "==========Work with Hash==========="
name = STDIN.gets.chomp

domains1 = {"Cherkasskaya" => "'ck'",
            "Chernovitskaya" => "'cv'",
            "Krym" => "'crime'",
            "Donetskaya" => "'dn'",
            "Dnepropetrovskaya" => "'dp'",
            "Ivano-Frankovskaya" => "'if'",
            "Kirovogradskaya" => "'kr'",
}

domains1["Khersonskaya"] = "'ks'"

if domains1.has_key?(name)
  puts "Domain this oblast is #{domains1[name]}"
else
  puts "Domain is incorect"
end

domains2 = {"Odesskaya" => "'od'",
            "Sumskaya" => "'sumy'"

}
#method merge
puts "-----------------------"
both = domains1.merge(domains2)
puts both

puts "-------Calls block once for each key in hash---------------"
#method each_value
domains1.each_value { |item| puts item }

puts "--------------------"
#method keys and delete
puts domains1.keys
puts domains1.delete("Krym")
# Display count
puts "Count: #{domains1.count}"

# Set
puts "==========Work with Set==========="
set1 = Set.new([10, 20, 30, 40,])
set2 = Set.new([50, 60, 100])
print set1 == set2
set2.add("Krym")
puts set2.inspect
puts set2.size
puts set2.include?("Krym")
puts (set1+set2).inspect



