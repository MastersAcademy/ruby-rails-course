class TimeError < StandardError
  def initialize(msg="There is no such time")
    super(msg)
  end
end

module PersonInfo
  @@counter = 0
  attr_accessor :email, :name, :surname, :id
  def input_info(email, name, surname, id)
    @name = name
    @surname = surname
    @email = email
    @id = @@counter+=1
  end
end


class User
  include PersonInfo

  attr_accessor :adress, :mass

  def initialize(email, name, surname, adress, mass)
    input_info(email, name, surname, id)
    @adress = adress
    @mass = mass
    puts "User nuber #{id} - #{name} come to gym"
    User.rest
    rescue NoMethodError => e
      p e.message
      p e.backtrace
      User.class.send(:define_method, :rest) { puts "eat and sleap" }
      User.rest

  end

  def work_with_weight(weight)
    if weight >= 100 && @mass <= 50
      puts "#{name} was smashed by #{weight} kg"
    else
      puts "#{name} become stronger"
    end
  end

end


class Trainer
  include PersonInfo
  attr_accessor :experience, :price

  def initialize(email, name, surname, experience)
    input_info(email, name, surname, id)
    @experience = experience
    puts "Trainer #{id} #{name} #{surname} ready to work"
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

class Manager
  include PersonInfo

  def times_up(time)
    begin
      raise TimeError.new unless time.to_i.between?(0, 23)#time.to_i>0 && time.to_i<23
      rescue TimeError => e
        p e.message
        p e.backtrace
      else
        if time.to_i.between?(8, 22)
          puts "Gym is open! Come inside, if you want!"
        else
          puts "Gym is closed, go away!"
        end
    end
  end

  def initialize(email, name, surname)
    input_info(email, name, surname, id)
    puts "My name is #{name}, wellcome in our gym"
  end
end

user1 = User.new('afk@bk.ru', 'Rocky', 'Balboa', 'New-York', 40)
user1.work_with_weight(100)
trainer1 = Trainer.new('fooboo@mail.ru', 'Bilbo', 'Begins', 15)
trainer1.technique(50, 60)
manager1 = Manager.new('beast@mail.ua', 'Sasha', 'Grey')
puts "==When there an error=="
manager1.times_up(25)
puts "==When there isn't=="
manager1.times_up(9)
