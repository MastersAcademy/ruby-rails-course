#Home Work 6

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

module InfoUser
  def user_info
    begin
     puts "Choose information about user:"
      puts "gloom - 1\nmrak - 2\nmaerorem - 3\n"
      choice = gets.to_i
      users = {
        1 => {name: 'Dima', nikname: 'gloom', email: 'gloom@rubycourses.com', experience: 'Ruby on Rails'},
        2 => {name: 'Ura', nikname: 'mrak', email: 'mrak@rubycourses.com', experience: 'Ruby on Rails'},
        3 => {name: 'Oleg', nikname: 'maerorem', email: 'maerorem@rubycourses.com', experience: 'Ruby on Rails'},
             }
      users = users[choice]
      users.each{|key, value| puts key, value}
    rescue NoMethodError
      puts "Please choose users from 1 to 3"
    retry
    ensure
      puts "There is information about user your looking for!"
    end
  end
end

class Inform
  extend FormatAttributes
  include Formatter
  attr_accessor :gender, :location, :iq
  formats :gender, :location, :iq
end

class User
  extend FormatAttributes
  include Formatter
  include InfoUser
  attr_accessor :name, :nikname, :email, :experience
  formats :name, :nikname, :email, :experience
  
 def main

    begin
      puts "Welcome to database!\nEnter - 1 for choose 'Information about user' or 2 'If you want to see the unnecessary information'!"
      choice = gets.to_i
      case choice

      when 1
        user_info
      when 2
      inform = Inform.new
      inform.gender = "male"
      inform.location = "Cherkasy"
      inform.iq = "142"

      inform.display
      else

        if [1,2].include? choiсe
          raise "Try again!"
        end
      end
    rescue StandardError
        puts "You enter wrong argument, try again and choose 1 or 2!"
      retry
    end
  end
end

User.new.main