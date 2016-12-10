#Home Work 5

module FormatAttributes
  def formats(*attributes)
    @format_attributes = attributes
  end
  
  def format_attributes
    @format_attributes
  end
end

module Formatter
  def display
    self.class.format_attributes.each do |attribute|
      puts "[#{attribute.to_s.upcase}] #{send(attribute)}"
    end
  end
end

class User
  extend FormatAttributes
  include Formatter
  attr_accessor :name, :nikname, :email, :experience
  formats :name, :nikname, :email, :experience
end

user = User.new
user.name = "Dima"
user.nikname = "gloom"
user.email = "gloom@rubycourses.com"
user.experience = "Ruby on Rails"

user.display

class Inform
  extend FormatAttributes
  include Formatter
  attr_accessor :gender, :location, :iq
  formats :gender, :location, :iq
end

inform = Inform.new
inform.gender = "male"
inform.location = "Cherkasy"
inform.iq = "142"

inform.display