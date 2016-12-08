class Visitor
  attr_accessor :food_array, :food, :complaint

  def initialize(menu)
    puts 'Хмм, подивимось що тут є смачненького'
    self
  end

  def chooze_food(food_array)
    @food_array = food_array
    puts 'Прийміть моє замовлення:'
    @food_array.each { |meal| puts meal }
    self
  end

  def eat(food)
    puts 'Ом-ном-ном, дуже смачно'
  end

  def pay
    puts 'Just take my money'
  end

  def ask_for_administrator
    puts 'Позвіть, будь ласка, адміністратора!'
  end
end

class Waiter
  attr_accessor :food_array, :prepared_food, :result_check

  def initialize
    puts 'Вітаю в нашому кафе, чого бажаєте?'
  end

  def give_check
    puts 'Прошу, ваш чек'
  end
end

class Cook
  attr_accessor :food_array, :prepared_food

  def cook(food_array)
    @food_array = food_array
  end

  def give_food
    @prepared_food = @food_array
    puts "Замовлення готове!"
    prepared_food
  end
end

class Administrator < Waiter
  attr_accessor :complaint

  def take_customer_complaint(complaint)
    puts 'Доброго дня, я можу чимось Вам допомогти?'
  end

  def complaint_response
    puts 'Не хвилюйтесь зараз все поправимо! Хочете 15% знижку?'
  end
end

anna = Waiter.new
bill = Cook.new
tom = Administrator.new

puts 'Перший візитор'
puts '==================================================================='
arnold = Visitor.new('Принесіть меню, будь ласка')
arnold.chooze_food(['Кава', '2 круасани з шоколадом'])
anna.food_array = arnold.food_array
bill.cook(anna.food_array)
anna.prepared_food = bill.give_food
arnold.eat(anna.food_array)
anna.give_check
arnold.pay
puts '==================================================================='
puts ''

puts 'Другий візитор'
puts '==================================================================='
sarra = Visitor.new('Принесіть меню, будь ласка')
sarra.chooze_food(['Чай', 'круасан з вишнею'])
anna.food_array = sarra.food_array
bill.cook(anna.food_array)
anna.prepared_food = bill.give_food
sarra.ask_for_administrator
sarra.complaint = 'Не те що я очікувала'
tom.take_customer_complaint(sarra.complaint)
tom.complaint_response
anna.food_array = sarra.food_array
bill.cook(anna.food_array)
anna.prepared_food = bill.give_food
sarra.eat(anna.food_array)
anna.give_check
sarra.pay
