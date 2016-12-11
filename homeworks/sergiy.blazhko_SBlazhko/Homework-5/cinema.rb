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

class Ticket

  attr_accessor :film_name, :cost

  def initialize attributes = {}
    @film_name = attributes[:film_name]
    @cost = attributes[:film_name]
  end 

  def self.print_ticket film_name
    Ticket.new(film_name: "#{film_name}", cost: 100)
  end 
end

class Person
  
  attr_accessor :name

  def initialize attributes = {}
    @name = attributes[:name]
  end
end

module CashierCreator
  def get_cashier
    Person.new(name: "Cashier")
  end
end

module GuestCreator
  def get_guest
    Person.new(name: "Guest")
  end
end

module CashierWorker
  def show_film_catalog
    Film.get_films.each{|film| puts "Title: #{film.title} /  Duration: #{film.duration} / Age restrictions: #{film.age_restrictions}\n"}
    puts "\n"
  end

  def sell_ticket chosen_film
    Ticket.print_ticket chosen_film
  end 
end

class Cinema

  extend CashierCreator
  extend GuestCreator
  extend CashierWorker

  @cashier = get_cashier
  @guest = get_guest

  @films = Film.get_films.map(&:title)

  i = 0  
  while i != 1 do 
    ticket_sell = false
    while ticket_sell != true do
      show_film_catalog
      puts "Hello #{@guest.name}. Please chose film_name with film list(just type film name like Hobbit 1). \n\n"
      @chosen_film = gets.chomp
      
      if @films.include?(@chosen_film)
        sell_ticket @chosen_film
        puts "Thank you #{@guest.name}, take you ticket for film #{@chosen_film} \n\n"
        p
        puts "Next guest please :) !!! \n\n"
        ticket_sell = true
      else
        puts "Film not chosen, please say again what film you want to see?\n\n"
      end 
    end 
  end
end
