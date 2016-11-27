require_relative 'guest'
require_relative 'cashier'

class Cinema

  @cashier = Cashier.new(name: "Cashier")
  @guest = Guest.new(name: "Guest")

  @films = Film.get_films.map(&:title)

  i = 0  
  while i != 1 do 
    ticket_sell = false
    while ticket_sell != true do
      @cashier.show_film_catalog
      puts "Hello #{@guest.name}. Please chose film_name with film list(just type film name like Hobbit 1). \n\n"
      @chosen_film = gets.chomp
      
      if @films.include?(@chosen_film)
        @cashier.print_ticket @chosen_film
        puts "Thank you #{@guest.name}, take you ticket for film #{@chosen_film} \n\n"
        p
        puts "Next guest please :) !!! \n\n"
        ticket_sell = true
      else
        puts "Film not chosen, please say again what film you want to see.\n\n"
      end 
    end 
  end
end