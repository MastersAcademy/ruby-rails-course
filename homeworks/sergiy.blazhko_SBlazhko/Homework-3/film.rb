  class Film
  
  attr_accessor :title, :duration, :cost, :age_restrictions
  
  def initialize attributes = {} 
    @title = attributes[:title]
    @duration = attributes[:duration]
    @cost = attributes[:cost]
    @age_restrictions = attributes[:age_restrictions]     
  end

  def self.create_films
    films = []   
    film1 = Film.new(title: "Hobbit 1", duration: 120, cost: 100, age_restrictions: 14 )
    film2 = Film.new(title: "Hobbit 2", duration: 145, cost: 120, age_restrictions: 15 )
    film3 = Film.new(title: "Hobbit 3", duration: 150, cost: 150, age_restrictions: 16 )
    films.push film1  
    films.push film2  
    films.push film3
    return films
  end

  def self.get_films
    Film.create_films
  end


end