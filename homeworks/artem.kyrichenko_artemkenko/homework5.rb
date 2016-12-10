module Ifnformation
  attr_accessor :email, :name, :surname
  def input_info (email, name, surname)
    @name = name
    @surname = surname
    @email = email
  end
end


class User
  include Ifnformation

  @@counter = 0
  attr_accessor :id , :adress, :mass

  def initialize(email, name, surname, adress, mass)
    input_info(email, name, surname)
    @adress = adress
    @id = @@counter+=1
    @mass = mass

    puts "User nuber #{id} - #{name} come to gym"
  end

  def workwithweight(weight)
    if weight >= 100 && @mass <= 50
    puts "#{name} was smashed by #{weight} kg"
    else
    puts "#{name} become stronger"
    end
  end

end


class Trainer
  include Ifnformation
  @@counter = 0
  attr_accessor :trainerid , :experience, :price

  def initialize(email, name, surname, experience)
    input_info(email, name, surname)
    @experience = experience
    @trainerid = @@counter+=1



    puts "Trainer #{trainerid} #{name} #{surname} ready to work"
  end

  def technique(price, cost)
    @price = price
    @cost = cost
    if @cost >= @price
    puts "Give to user technique"
    else
    puts "Look for some one else, user"
    end
  end

end

class << User
  def rest
    puts "eat"
    puts "sleep"
  end
end

class Manager
  include Ifnformation

  def initialize(email, name, surname)
    input_info(email, name, surname)

    puts "My name is #{name}, wellcome in our gym"
  end

  def timesup(time)
    if time >= 8 && time <= 22
    puts "Gym is open! Come inside, if you want!"
    else
    puts "Gym is closed, go away!"
    end
  end

end

user1 = User.new('afk@bk.ru', 'Rocky', 'Balboa', 'New-York', 40)
user1.workwithweight(100)
trainer1 = Trainer.new('fooboo@mail.ru', 'Bilbo', 'Begins', 15)
trainer1.technique(50, 60)
User.rest()
manager1 = Manager.new('beast@mail.ua', 'Sasha', 'Grey')
manager1.timesup(12)
