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