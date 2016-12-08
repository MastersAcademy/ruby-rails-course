require 'date'

class Ticket
  @@counter = 0
  attr_reader :id, :price, :from, :to, :date
  attr_accessor :user

  def initialize(price, from, to, date)
    @id = @@counter += 1
    @price = price
    @from = from
    @to = to
    @date = date
  end

end

class User
  attr_reader :id, :email, :registered, :tickets
  attr_accessor :first_name, :last_name

  @@counter = 0
  @@users = []

  def initialize(first_name, last_name, email)
    @id = @@counter += 1
    @first_name = first_name
    @last_name = last_name
    @email = email
    @tickets = []
  end

  def self.add(user)
    @@users += [user]
  end

  def self.all
    @@users
  end

  def self.registered
    @@users.select { |u| u.registered == true }
  end

  def self.guests
    @@users.select { |u| u.registered == false }
  end

  def buy_ticket(ticket)
    ticket.user = self
    @tickets += [ticket]
  end

  def return_ticket(ticket)
    ticket.user = nil
    @tickets -= [ticket]
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end

class GuestUser < User
  def initialize(first_name, last_name, email)
    super
    @registered = false
    User.add(self)
  end
end

class RegisteredUser < User
  attr_accessor :nickname

  def initialize(first_name, last_name, email, nickname)
    super(first_name, last_name, email)
    @nickname = nickname
    @registered = true
    User.add(self)
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
