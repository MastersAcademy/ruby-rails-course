
module User_data
  attr_accessor :name, :surname, :city, :department
  def info (name, surname, city, department)
    @name, @surname, @city, @department = name, surname, city, department
  end
end

module Opening_hours
  def open
    time = Time.now.to_a
    if time[2] <8 || time[2] >18
       puts "Отделение работает с 8 до 18. Приходите в рабочее время"
       puts "или отправляйтесь в отделения круглосуточного обслуживания"
    else
      puts "Отделение работает"
    end
  end
end


class Manager
  include User_data
  @@counter = 1170003128

  def initialize(name, surname, city, department)
    info(name, surname, city, department)

    puts "Добрый день! Меня завут #{surname} #{name}" 
    puts "Я менеджер #{department} отделения, в городе #{city}." 
    puts "Чем могу помочь?"
  end

  def declar
    puts "Ваш номер декларации #{@@counter+=1}"
  end
  
  def recipient
    puts "Вот Ваша посылка. Возьмите и распишитесь "
    puts "Хорошего дня"
  end

end


class Sender
  include User_data
  extend Opening_hours
  
  def initialize(name, surname, city, department)
    info(name, surname, city, department)
  end

  def send(recipient_name, recipient_surname, recipient_city, recipient_department)
    puts "Я хочу отправить посылку:"
    puts "Получатель: #{recipient_name} #{recipient_surname}"
    puts "Город #{recipient_city}, отделение #{recipient_department}"
    puts "Мои данные #{name} #{surname} #{city} #{department}"
  end

  def pay(money)
    puts "#{name}, с вас 10 грн за отправку"
    if money == 10
      puts "Вы дали #{money} гривен. Оплачено"
    elsif money >= 100
      puts "У вас не будет купюры поменьше. У меня не будет из #{money} грн сдачи."
    elsif money > 10
      a = money - 10
      puts "Вы дали #{money} грн. Возьмите, пожалуйста, сдачу #{a} грн."
      puts "Хорошего дня!"
    else i = 10 - money
      puts "Пожалуйста, заплатите #{i} грн"
    end
  end
end

class Recipient
  include User_data
  extend Opening_hours

  def initialize(name, surname, city, department)
    puts "Добрый день. Я хочу получить посылку"
    puts "Вот данные для получения #{name}, #{surname}, #{city}, #{department}"
  end
end


puts "Отправитель пришёл в отделение укрпочты"
Sender.open
puts "Отправитель в отделении"
manager1 = Manager.new('Svetlana', 'Volkova', 'Borispol', '22')
sender1 = Sender.new('Boris', 'Sokolovskiy', 'Borispol', '22')
sender1.send('Pavlo', 'Nazarov', 'Kiev', '5')
sender1.pay(20)
manager1.declar
puts "Получатель пришёл в отделение укрпочты"
Recipient.open
puts "Получатель в отделении"
recipient1 = Recipient.new('Pavlo', 'Nazarov', 'Kiev', '5')
manager1.recipient


