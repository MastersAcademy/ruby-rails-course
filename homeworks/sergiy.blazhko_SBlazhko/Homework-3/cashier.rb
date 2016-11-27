require_relative 'film' 
require_relative 'ticket'  

class Cashier
  
  attr_accessor :name

  def initialize attributes = {}
    @name = attributes[:name]
  end

  def show_film_catalog
    Film.get_films.each{|film| puts "Title: #{film.title} /  Duration: #{film.duration} / Age restrictions: #{film.age_restrictions}\n"}
    puts "\n"
  end

  def print_ticket film
    ticket = Ticket.new(film_name: "#{film}", cost: 100)
    return ticket
  end 

end