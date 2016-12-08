
#Inheritance

class Manager

  attr_accessor :manager_name

  def cashier(cashier_name)
    @@manager_name = cashier_name
    
  end

  def hello(status, name)
    puts "Добрый день #{name}. Меня зовут #{@@manager_name}. Рада Вас приветствовать в нашем отделении"
    puts "Вы хотите поучить или отправить посылку?"
    if status == "send"
      puts "Я бы хотел отправить посылку"
    else 
      puts "Я бы хотел получить посылку"
    end
  end

end


class Sender < Manager
  
  def declaration(name_rec, adress_rec)
    puts "Я хочу отправить посылку #{name_rec} в #{adress_rec}, спасибо!"
  end

  def pay(money)
    puts "С вас 10 грн за отправку"
    if money == 10
      puts "Вы дали #{money} гривен. Оплачено"
    elsif money >= 100
      puts "У вас не будет купюры поменьше. У меня не будет из #{money} грн сдачи."
    elsif money > 10
      a = money - 10
      puts "Вы дали #{money} грн. Возьмите, пожалуйста, сдачу, #{a} грн."
      puts "Хорошего дня!"
    else i = 10 - money
      puts "Пожалуйста, заплатите #{i} грн"
    end
  end

end


class Reciplient < Manager
  
  def verified(documents)
    if documents == "yes"
      puts "Возьмите вашу посылку и расспишитесь"
      puts "Удачи Вам!"
    else
      puts "Извините, мне нужны Ваши документы для удостоверения личности"
    end
    
  end

end
  
  puts "В отделение пришёл отправитель"
  puts "*********************************************************************"
  cashier1 = Manager.new
  cashier1.cashier("Svetlana")
  sender1 = Sender.new
  sender1.hello("send", "Sergey Ripchanskiy")
  sender1.declaration("Gopko Taras", "Kirovograd")
  sender1.pay(11)
  puts "*********************************************************************"
  puts "В отделение заходит получатель"
  puts "*********************************************************************"
  cashier1 = Manager.new
  cashier1.cashier("Olga")
  reciplient1 = Reciplient.new
  reciplient1.hello("get", "Gopko Taras")
  reciplient1.verified("yes")
