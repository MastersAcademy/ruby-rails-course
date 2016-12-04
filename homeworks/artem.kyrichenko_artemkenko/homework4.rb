class Arrayexamples

  def initialize
    replace_arr
    insert_in_arr
    count_method
    collect_method
  end

  def replace_arr
    a = [1, 2, 3]
    puts "Before arr a was #{a}"
    a.replace([1])
    puts "Now arr a is #{a}"
  end

  def insert_in_arr
    mugiwaras = ["Luffy", "Zoro", "Nami", "Usopp", "Sanji", "Robin", "Chopper"]
    puts "Mugiwaras team include #{mugiwaras}"
    mugiwaras.insert(7, "Franky")
    puts "Now they look like that - #{mugiwaras}"
  end

  def count_method
    a = [1, 4, 5, "yoda", 2,"gendalf"]
    puts "Number of elements in this array is #{a.count}"
  end

  def collect_method
    a = ["white", "red", "blue", "green"]
    puts "ther are colors #{a}"
    puts a.collect{ |x| x + " ranger"}

  end

end

class Hashexamples

  def initialize
    include_method
    return_value_method
    invert_method
    key_method
    delete_method
  end

  def include_method
    h = { "a" => 100, "b" => 200, "c" => "gif"}
    puts h.has_key?("a")
    puts h.has_key?("zimbabve")
  end

  def return_value_method
    zoo = { "cow" => "mooo", "cat" => "nya", "hulk" => "smash"}
    puts zoo.fetch_values("cow", "cat")
  end

  def invert_method
    lol = { Jinx: "adc", Garen: "top", Ahri: "mid"}
    puts lol.invert
  end

  def key_method
    lol = { Jinx: "adc", Garen: "top", Ahri: "mid"}
    puts lol.key("adc")
    puts lol.key("top")
    puts lol.key("mid")
  end

  def delete_method
    lol = { "Master YI" => "1 button", "Garen" => "Good", "Ahri" => "Good girl"}
    puts lol
    lol.delete ("Master YI")
    puts lol
  end

end
Hashexamples.new
Arrayexamples.new
