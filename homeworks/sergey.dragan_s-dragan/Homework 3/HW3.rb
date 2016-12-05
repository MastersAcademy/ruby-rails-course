#Inheritance

class Manager

  def hello(status, name)

    if status == "new_cl"
       puts "Добрый день #{name}!"
       puts "Какой вид топлива желаете?"
    else 
       puts "Чего шаришся, #{name}, иди работай"
    end
  end

end


class Client < Manager
  
  def fuel(power)
    if power == "Соляра"
      puts "Мне нужна #{power}"
      puts "Подьезжайте к первой колонке."
    elsif power == "Газ"
      puts "Мне бы газку"
      puts "Газ закончился"
    else
      puts "Понятно"
    end
  end

  def pay(money)
    puts "С Вас 220 гривен.Наличный или безналичный расчет?"
    if money == "безналичный"
      puts "У Вас #{money} расчет. Пройдемте к терминалу."
    elsif money == "наличный"
      puts "У Вас #{money}. Будьте добры,купюры меньшим номиналом."
    end
  end

end


class Refueller < Manager
  def status(status_now)
    if status_now == "free"
      puts "Чего шаришся, тебе же сказали, иди работай!"
    elsif status_now == "bysu"
      puts "Я работаю,обслуживаю клиента."
    else
      puts "Так ты занят или нет?"
    end
  end
end
  
  puts
  puts "Первый клиент"
  client1 = Client.new
  client1.hello("new_cl", "Матвей")
  client1.fuel("Соляра")
  client1.pay("безналичный")
  puts
  puts "Заходит заправщик"
  refueller1 = Refueller.new
  refueller1.hello("ff", "Тимофей")
  refueller1.status("bysu")
  puts
  puts "Второй клиент"
  client2 = Client.new
  client2.hello("new_cl", "Борис")
  client2.fuel("Газ")
  