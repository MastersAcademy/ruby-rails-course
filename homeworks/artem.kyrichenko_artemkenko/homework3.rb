class User

  @@counter = 0
  attr_accessor :email, :name, :surname, :id , :adress, :mass
  
  def initialize(email, name, surname, adress, mass)
    @name = name
    @surname = surname 
    @email = email
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

  @@counter = 0
  attr_accessor :email, :name, :surname, :trainerid , :experience, :price
  
  def initialize(email, name, surname, experience)
    @name = name
    @surname = surname 
    @email = email
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

  attr_accessor :email, :name, :surname 
  
  def initialize(email, name, surname)
    @name = name
    @surname = surname 
    @email = email

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
