class Driver

  attr_accessor :name, :license

  def name=(name)
    if name == ''
      raise "Name can't be blank!"
    end
    @name = name
  end

  def licence=(licence)
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

  attr_accessor :name

  def name=(name)
    if name == ''
      raise "Name can't be blank!"
    end
    @name = name
  end

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

  attr_accessor :name, :benefits, :has_ticket

  def name=(name)
    if name == ''
      raise "Name can't be blank!"
    end
    @name = name
  end

  def benefits=(benefits)
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

driver = Driver.new
driver.name = 'Sam'
driver.licence = true
stations = %w(Station1 Station2 Station3 Station4 Station5 Station6 Station7)
puts 'Current way:'
driver.route(stations)

conductor = Conductor.new
conductor.name = 'Sara'

tickets = TravelDocuments.new
tickets.set_prices(100, 50)

good_passenger = Passenger.new
good_passenger.name = 'Good Passenger'
good_passenger.benefits = false
good_passenger.buy_ticket(tickets)
#puts good_passenger.inspect
bad_passenger = Passenger.new
bad_passenger.name = 'Bad Passenger'
bad_passenger.benefits = false
#puts bad_passenger.inspect
passenger_with_benefits = Passenger.new
passenger_with_benefits.name = 'Passenger With Benefits'
passenger_with_benefits.benefits = true
passenger_with_benefits.buy_ticket(tickets)
puts '----------------------------'
passengers = [good_passenger, bad_passenger, passenger_with_benefits]
passengers.each{ |passenger| conductor.check_documents(passenger)}
conductor.blow(bad_passenger)
