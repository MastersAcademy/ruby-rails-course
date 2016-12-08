a = [1, 2, 3]
puts "Before arr a was #{a}"
a.replace([1])
puts "Now arr a is #{a}"
mugiwaras = ["Luffy", "Zoro", "Nami", "Usopp", "Sanji", "Robin", "Chopper"]
puts "Mugiwaras team include #{mugiwaras}"
mugiwaras.insert(7, "Franky")
puts "Now they look like that - #{mugiwaras}"
b = [1, 4, 5, "yoda", 2,"gendalf"]
puts "Number of elements in this array is #{b.count}"
y = ["white", "red", "blue", "green"]
puts "ther are colors #{y}"
puts y.map { |x| x + " ranger"}
h = { "a" => 100, "b" => 200, "c" => "gif"}
puts h.has_key?("a")
puts h.has_key?("zimbabve")
zoo = { "cow" => "mooo", "cat" => "nya", "hulk" => "smash"}
puts zoo.fetch_values("cow", "cat")
lol = { Jinx: "adc", Garen: "top", Ahri: "mid"}
puts lol.invert
lol = { Jinx: "adc", Garen: "top", Ahri: "mid"}
puts lol.key("adc")
puts lol.key("top")
puts lol.key("mid")
lol = { "Master YI" => "1 button", "Garen" => "Good", "Ahri" => "Good girl"}
puts lol
lol.delete("Master YI")
puts lol
