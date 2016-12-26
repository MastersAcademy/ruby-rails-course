class NoVerificationDocuments < StandardError
  attr_accessor :message

  def initialize(message)
    @message = message
    puts message
  end
end

module UserData
  attr_accessor :name, :surname, :city, :department
  def custom_attributes (name, surname, city, department)
    @name, @surname, @city, @department = name, surname, city, department
  end
end


class Manager
  include UserData
  attr_accessor :verification

  def initialize(name, surname, city, department)
    custom_attributes(name, surname, city, department)

    puts "Добрый день! Меня завут #{@surname} #{@name}" 
    puts "Я менеджер #{@department} отделения, в городе #{@city}." 
    puts "Чем могу помочь?"
  end


  def verification_documents=(verification) 
    @verification = verification
    puts "Подождите минутку. Идёт проверка документов"
  end

  def pay_package_and_say_goodbye
    if @verification == true
    puts "Вот Ваша посылка. Возьмите и распишитесь "
    puts "Хорошего дня"
    else
      raise NoVerificationDocuments.new("Извините, возникла проблема с документами!")
    end
  end
end


class Sender
  include UserData
  
  def initialize(name, surname, city, department)
    custom_attributes(name, surname, city, department)
    Sender.gift_for_the_manager()
    rescue NoMethodError => e
        p e.message
        p e.backtrace
        Sender.class.send(:define_method, :gift_for_the_manager) { puts "О, какой у вас красивый маникюр!" }
        Sender.gift_for_the_manager()
  end

  def send_a_parcel(recipient_name, recipient_surname, recipient_city, recipient_department)
    puts "Я хочу отправить посылку:"
    puts "Получатель: #{recipient_name} #{recipient_surname}"
    puts "Город #{recipient_city}, отделение #{recipient_department}"
    puts "Мои данные: #{@name} #{@surname} #{@city} #{@department}"
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
  include UserData

  def initialize(name, surname, city, department)
    custom_attributes(name, surname, city, department)
    
    puts "Добрый день. Я хочу получить посылку"
  end

  def receive_the_parcel
    puts "Вот данные для получения #{@name}, #{@surname}, #{@city}, #{@department}"
  end
end


puts "Отправитель пришёл в отделение укрпочты"
manager1 = Manager.new('Svetlana', 'Volkova', 'Borispol', '22')
sender1 = Sender.new('Boris', 'Sokolovskiy', 'Borispol', '22')
sender1.send_a_parcel('Pavlo', 'Nazarov', 'Kiev', '5')
sender1.pay(20)
puts "Получатель пришёл в отделение укрпочты"
recipient1 = Recipient.new('Pavlo', 'Nazarov', 'Kiev', '5')
recipient1.receive_the_parcel
manager1.verification_documents = false
manager1.pay_package_and_say_goodbye


