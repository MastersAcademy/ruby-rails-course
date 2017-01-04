require 'date'

module Counterable
  @@counter = 0

  attr_reader :id

  def set_id
    @id = @@counter += 1
  end
end

module TicketsBuyer

  def buy_ticket(ticket)
    ticket.user = self
    @tickets += [ticket]
  end

  def return_ticket(ticket)
    ticket.user = nil
    @tickets -= [ticket]
  end

end

module User
  include Enumerable
  attr_reader :email, :registered, :tickets
  attr_accessor :first_name, :last_name

  @@list = []

  def self.extended(base)
    base.include(User)
  end

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @tickets = []
    @@list += [self]
  end

  def self.add(user)
    @@list += [user]
  end

  def self.all
    @@list
  end

  def self.registered
    @@list.select { |u| u.registered == true }
  end

  def self.guests
    @@list.select { |u| u.registered == false }
  end

  def each(&block)
    @@list.each(&block)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

class GuestUser
  extend User
  include Counterable
  include TicketsBuyer

  def initialize(first_name, last_name, email)
    super
    set_id
    @registered = false
  end
end

class RegisteredUser
  extend User
  include Counterable
  include TicketsBuyer

  attr_accessor :nickname

  def initialize(first_name, last_name, email, nickname)
    super(first_name, last_name, email)
    set_id
    @nickname = nickname
    @registered = true
  end

end

class Airport
  attr_reader :name, :city, :country

  def initialize(name, city, country)
    @name = name
    @city = city
    @country = country
  end

end

class Ticket
  include Counterable

  attr_reader :price, :from, :to, :date
  attr_accessor :user

  def initialize(price, from, to, date)
    set_id
    @price = price
    @from = from
    @to = to
    @date = date
  end

end

user = RegisteredUser.new('Yura', 'Smagliy', 'email@email.com', 'ih47')
guest = GuestUser.new('Gary ', 'Oldman', 'guest@guest.com')
airport_from = Airport.new('Domodedovo', 'Moscov', 'Russia')
airport_to = Airport.new('Charles de Gaulle', 'Paris', 'France')
ticket = Ticket.new(2000, airport_from, airport_to, Date.today)

puts "Registered user: #{user.inspect}"
puts "Guest user: #{guest.inspect}"
puts "Ticket: #{ticket.inspect}"

guest.buy_ticket(ticket)
puts "User's tickets: #{guest.tickets.inspect}"

guest.return_ticket(ticket)
puts "User's tickets after return: #{guest.tickets.inspect}"

puts "Users count: #{GuestUser.count}"
