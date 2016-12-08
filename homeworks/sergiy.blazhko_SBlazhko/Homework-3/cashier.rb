require_relative 'film' 
require_relative 'ticket'
require_relative 'person'  

class Cashier < Person
  
  def show_film_catalog
    Film.get_films.each{|film| puts "Title: #{film.title} /  Duration: #{film.duration} / Age restrictions: #{film.age_restrictions}\n"}
    puts "\n"
  end

  def sell_ticket chosen_film
    Ticket.print_ticket chosen_film
  end 

  def self.get_cashier
    Cashier.new(name: "Cashier")
  end

end