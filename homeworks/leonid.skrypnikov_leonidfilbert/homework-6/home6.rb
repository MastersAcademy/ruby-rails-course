puts 
puts "создание первого чека "
puts 

#считать цену товаров нам нужно будет не только в чеке. вынесем этот метод в модуль

module Global
  
  class << self
    attr_accessor :k
    attr_accessor :a
  end
  
end

module Calculator
  
  def total_price(value)
    puts "общая цена: #{value}$"
  end
  
end

module Discount
  
  def self.extended(base)
    #задействовать скидку
    begin
      Global.k *= 0.98
      Global.k = sprintf("%.2f", Global.k).to_f 
    rescue StandardError
      puts "для начала введите общую сумму. Ошибка: #{$!}"
      #пересылаем на шаг пересчета цены
    end
  end
  
end
  
class TabCounter
  attr_accessor :count
  
  def count=(value)
    @count = value
    Global.a = @count
    change_roll if max_count?
  end 
  
  def initialize
    @count = 0
  end
  
  def max_count?
    @count % 1000 == 0 
  end
  
  private

  def change_roll
    puts "поставить рулон другой маркировки "
  end
  
end

class TabCreator
  
  include Calculator
  
  def self.new
    tab = super 
    @counter.count += 1 
    tab 
  end
  
  def self.counter=(object)
    @counter = object
  end
  
  def write_date(day, month, year)
    puts "\t\t#{day}.#{month}.#{year}"
  end
  
  def tab_number(value)
    puts "номер чека: #{value}"
  end
  
  def seller_number(number)
    puts "номер продавца: #{number}"
  end
  
  def goods(list)
    puts "список продуктов: #{list}"
  end
  
  def discount_card(number)
    puts "номер дисконтной карты: #{number}$"
  end
end

def new_metod(a)
  
  a.access_confirm
  rescue NoMethodError 
    puts "Вы не можете сделать это"
    def access_confirm
      puts "Подтвердите доступ"
    end
    a.access_confirm
  
end

TabCreator.counter = TabCounter.new
myfirsttab = TabCreator.new
Global.k = 27.45
myfirsttab.write_date(25,11,2016)
myfirsttab.tab_number(Global.a)
myfirsttab.seller_number("0230564f32")
# вот тут нужно будет добавить цену.
myfirsttab.goods("фольга, ножницы, негазированная минеральная вода")
myfirsttab.extend Discount
myfirsttab.total_price(Global.k)
myfirsttab.discount_card("1482245k2s35")
puts 
puts "а теперь создадим 1000 пустых чеков и заставим продавца заменить рулон"
puts 

1000.times do
  TabCreator.new
end

strangetab = TabCreator.new
puts
puts "действие пользователя не соответствует инструкции"
puts
new_metod(strangetab)
puts
puts "вторая попытка"
puts
new_metod(strangetab)
puts
