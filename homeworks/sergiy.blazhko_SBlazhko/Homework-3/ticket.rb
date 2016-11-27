class Ticket

  attr_accessor :film_name, :cost

  def initialize attributes = {}
    @film_name = attributes[:film_name]
    @cost = attributes[:film_name]
  end  
end