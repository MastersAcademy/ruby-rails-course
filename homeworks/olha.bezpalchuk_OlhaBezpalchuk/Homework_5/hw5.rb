module Name
  attr_accessor :name

  def name=(name)
    if name == ''
      raise "Name can't be blank!"
    end
    @name = name
  end
end


module Checker
  def check(what_to_check, value)
    if value
      puts "So, you have #{what_to_check}. Good."
    else
      puts "So, you don't have #{what_to_check}."
    end
  end
end


class Driver
  include Name

  attr_accessor :license

  def licence=(licence)
    @licence = licence
  end

  def route(stations)
    if @licence
      stations.each { |station| puts stop(station)}
    else
      raise "Driver can't work without licence!"
    end
  end

  def stop(station)
    puts "Station #{station}."
  end
end


class Conductor
  include Name
  include Checker

  def check_documents(passenger)
    puts "Hello, #{passenger.name}"

    check('benefits', passenger.show_benefits)
    check('travel documents', passenger.show_documents)

    if passenger.show_documents
      puts 'Documents are ok. Have a nice trip!'
    else
      puts 'You must be fined.'
    end
  end

  def blow(passenger)
    puts "Get away, #{passenger.name}!"
  end
end


class Passenger
  include Name
  attr_accessor :benefits, :has_ticket

  def benefits=(benefits)
    @benefits = benefits
    @has_ticket = false
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
