module Human

  attr_accessor :name

  def name=(name)
    if name == ''
      raise "Name can't be blank!"
    end
    @name = name
  end

end

module Transport

  def initialize(number_of_places, max_number_of_places)
    @number_of_places = number_of_places
    @max_number_of_places = max_number_of_places
    remaining
  end

  def has_places
    if @number_of_places > 0
      true
    else
      false
    end
  end

  def free_place
    @number_of_places += 1
    @number_of_places = @max_number_of_places if @number_of_places > @max_number_of_places
    remaining
  end

  def take_place
    @number_of_places -= 1
    @number_of_places = 0 if @number_of_places < 0
    remaining
  end

  def remaining
    puts "Places remaining #{@number_of_places}"
  end

end

class Driver

  include Human

  attr_accessor :license

  def initialize(name, licence)
    @name = name
    @licence = licence
  end

  def route(stations)
    if not(@licence)
      raise "Driver can't work without licence!"
    else
      stations.each { |station| puts stop(station)}
    end
  end

  def stop(station)
    puts "Station #{station}."
  end

end

class Conductor

  include Human

  def check_documents(passenger)
    puts "Hello, #{passenger.get_name}"
    check_benefits(passenger)
    if not(passenger.show_documents)
      fine
    else
      puts 'Documents are ok. Have a nice trip!'
    end
  end

  def check_benefits(passenger)
    if passenger.show_benefits
      puts 'You have benefits, I see. Good.'
    end
  end

  def fine
    puts 'You must be fined.'
  end

  def blow(passenger)
    puts "Get away, #{passenger.get_name}!"
  end
end

class Passenger

  include Human
  attr_accessor :benefits, :has_ticket

  def initialize(name, benefits)
    @name = name
    @benefits = benefits
    @has_ticket = false
  end

  def get_name
    @name
  end

  def buy_ticket(ticket)
    ticket.number_plus
    price = ticket.ticket_price(@benefits)
    puts "Passenger #{name} bought the ticket"
    puts "The ticket's price is #{price}."
    @has_ticket = true
  end

  def show_documents
    @has_ticket
  end

  def show_benefits
    @benefits
  end

end

class TravelDocuments

  attr_accessor :number, :price, :benefit_price

  def set_prices(price, benefit_price)
    @price = price
    @benefit_price = benefit_price
    @number = 0
  end

  def number_plus
    @number += 1
  end

  def get_number
    @number
  end

  def ticket_price(benefits)
    if benefits
      @benefit_price
    else
      @price
    end
  end
end

##################################
# testing
#

extend Transport
initialize(100, 100)

driver = Driver.new('Sam', true)
stations = %w(Station1 Station2 Station3 Station4 Station5 Station6 Station7)
puts 'Current way:'
driver.route(stations)

conductor = Conductor.new
conductor.name = 'Sara'

tickets = TravelDocuments.new
tickets.set_prices(100, 50)

good_passenger = Passenger.new('Good Passenger', false)
good_passenger.buy_ticket(tickets) if has_places
take_place
#puts good_passenger.inspect
bad_passenger = Passenger.new('Bad Passenger', false)
bad_passenger.benefits = false
#puts bad_passenger.inspect
passenger_with_benefits = Passenger.new('Passenger With Benefits', true)
passenger_with_benefits.buy_ticket(tickets) if has_places
take_place
puts '----------------------------'
passengers = [good_passenger, bad_passenger, passenger_with_benefits]
passengers.each{ |passenger| conductor.check_documents(passenger)}
conductor.blow(bad_passenger)
free_place
