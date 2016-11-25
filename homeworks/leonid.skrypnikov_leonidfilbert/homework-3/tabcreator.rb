puts ""
puts "создание первого чека "
puts ""

#считать цену товаров нам нужно будет не только в чеке. вынесем этот метод в модуль

module Calculator
  def total_price(value)
    puts "общая цена: #{value}$"
  end
end

class TabCounter
  attr_accessor :count
  
  def count=(value)
    @count = value
    $a = @count
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
  
  def self.new  
    tab = super 
    @counter.count += 1 
    tab 
  end
  
  def self.counter=(object)
    @counter = object
  end
  
  def write_date(day, month, year)
    puts "         #{day}.#{month}.#{year}"
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
  
  include Calculator
  
  def discount_card(number)
    puts "номер дисконтной карты: #{number}$"
  end
end


TabCreator.counter = TabCounter.new
myfirsttab = TabCreator.new
myfirsttab.write_date(25,11,2016)
myfirsttab.tab_number($a)
myfirsttab.seller_number("0230564f32")
# вот тут нужно будет добавить цену.
myfirsttab.goods("фольга, ножницы, негазированная минеральная вода")
myfirsttab.total_price(27.45)
myfirsttab.discount_card("1482245k2s35")
puts ""
puts "а теперь создадим 1000 пустых чеков и заставим продавца заменить рулон"
puts ""
1000.times do
  TabCreator.new
end