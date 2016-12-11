class Garden
  attr_reader :length, :width

  def initialize(length, width)
    @length, @width = length, width
  end

  def hello
    puts "It is garden!"
  end
end

gargen = Garden.new("10m","10m")
puts gargen.hello
puts gargen.length
puts gargen.width

module Seedling
  def hello
    puts "it is seedling. Grow it!"
  end
end


class Paprica
  include Seedling

  def identification
    puts "It is paprica!"
  end
end

paprica = Paprica.new
puts paprica.hello
puts paprica.identification


class Tomato
  include Seedling

  def identification
    puts "It is tomato!"
  end
end

tomato = Tomato.new
puts tomato.hello
puts tomato.identification

class SeedlingFactory
  def self.build(seedling)
    case seedling
    when :tomato
      Tomato.new
    when :paprica
      Paprica.new
    end
  end
end

class Instrument
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def hello
    puts "it is #{@name}."
  end
end

shovel = Instrument.new('shovel')
bucket = Instrument.new("bucket")
water_pail = Instrument.new("water_pail")
water_hose = Instrument.new("water_hose")

puts shovel.hello
puts bucket.hello
puts water_pail.hello
puts water_hose.hello



module Gardeners
  def initialize (first_name, sex, age)
    @name, @sex, @age = first_name, sex, age
  end

  def working
    puts "pick up a shovel"
    puts "get out of the hands of a shovel"
    puts "shovel to dig wells 15 to 15 cm, 20 cm deep, with an interval of 30 cm"
    puts "22.times do"
    puts "go to the next row"
    puts "make watering for all rows"
    puts "after watering take shovel"
    puts "plant "
  end
end

class Mother
  include Gardeners

  def hello
    puts "She is Alice"
  end

  def watering
    puts "take a bucket"
    puts "to put a bucket under water_pail"
    puts "open water_pail"
    puts "pour into a bucket of water"
    puts "close water_pail"
    puts "pour a bucket of rows"
  end

  def plant
    seedling = SeedlingFactory.build(:tomato)
    seedling.identification
    puts "take a  tomato"
    puts "put  tomato in a hole"
    puts "100.times do"
    puts "fill all holes earth"
  end
end

mother = Mother.new("Alice", "female", "35 years")
puts mother.hello
puts mother.working
puts mother.watering
puts mother.plant

class Son
  include Gardeners

  def hello
    puts "He is Adam"
  end

  def waterning
    puts "take a water_hose"
    puts "to connect a water_hose with water_pail"
    puts "open water_pail"
    puts "pit pour water from a water_hose"
    puts "close water_pail"
  end

  def plant
    seedling = SeedlingFactory.build(:paprica)
    seedling.identification
    puts "take a  paprica"
    puts "put  paprica in a hole"
    puts "100.times do"
    puts "fill all holes earth"
  end
end


son = Son.new("Adam", "male", "14 years")
puts son.hello
puts son.working
puts son.waterning
puts son.plant
