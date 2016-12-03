puts "home4"
puts
class Hash
  
  def self.try
    each
    extend
    mass_check
    if_new
    update
  end
  
  def self.each
    @speed = {"internet explorer" => "low", "mozilla" => "medium", "opera" => "hight"}  
    @speed.each_with_index {|(key,value), i| puts "Top #{3-i}:  #{key}, with speed: #{value}" }
  end
  
  def self.extend
    @speed.store("google chrome", "same that opera") 
  end
  
  def self.mass_check
    puts 
    puts "internet explorer & opera speed?"
    puts @speed.values_at("internet explorer","opera")
  end
  
  def self.if_new
    puts
    puts "Safari speed?"
    @speed2 = Hash.new("i don`t know")
    puts @speed2["safari"]
    @speed2["safari"] = "high"
  end
  
  def self.update
    puts
    puts "time to update our info"
    @speed.update(@speed2)
    puts @speed
  end
    
end

class Array
 
  def self.try
    create
    add
    change
    reverse
  end
 
  def self.create
    #@array = Array[]
    game = "minesweeper"
    @array = %W{time to play the #{game}}
    puts @array
  end
  
  def self.add
    puts
    puts "**lets add today**"
    puts
    @array[5] = "today" 
    puts @array
  end
  
  def self.change
    puts
    puts "**elements with index 0,1,2**"
    puts @array[0,3]
    puts 
    @array2 = Array[]
    @array2.replace(@array)
    @array2[0,3] = ["must","not","pay"]
    puts "**lets change the elements with index 0,1,2**"
    puts @array2
  end
  
  def self.reverse
    puts
    puts "**put first array into second as a new element**"
    @array[6]= "****"
    @array += @array2
    puts @array.reverse
  end
end
puts "*****For Hash*********"
Hash.try
puts
puts "*****For Array********"
Array.try
