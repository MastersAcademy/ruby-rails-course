# homework 5
# Ruby example crm
# https://repl.it/Eptu/2

require 'date'

module Instance_description 
  def info
    if self.respond_to?(:name) 
      puts ">> #{name}." 
    elsif self.respond_to?(:number) 
      puts ">> #{self.class} ##{number}." 
    else
      puts ">> #{self}" 
    end
  end
end

module Class_description 

  def all
    ObjectSpace.each_object(self).to_a
  end

  def count
    all.count
  end

end

class Human
  attr_accessor :comment
  attr_reader :name
  
  def initialize(name, comment)
    @name, @comment = name, comment
  end
  include Instance_description
  extend Class_description
end

class Goods
  attr_reader :name, :weight, :price
  def initialize(name, weight, price)
    @name, @weight, @price = name, weight, price
  end
  include Instance_description
  extend Class_description
end

class DocumentSales
  
  attr_accessor :salesGood
  attr_reader :number, :date, :customer, :manager, :sum
  
  
  def initialize(number, date, customer, manager)
    @number, @date, @customer, @manager = number, date, customer, manager
    @salesGood, @sum= [], 0
  end

  def add(goods, amount)
    @salesGood << DocumentSalesGoods.new(self, goods, amount, goods.price) # 
    @sum += goods.price * amount
  end

  include Instance_description
  extend Class_description
end

class DocumentSalesGoods
  attr_reader :documentSales, :goods, :amount, :price
    def initialize(documentSales, goods, amount, price)
    @documentSales, @goods, @amount, @price = documentSales, goods, amount, price
  end
  include Instance_description
  extend Class_description
end

customer1 = Human.new('Покупатель 1', 'покупатель')
manager1 = Human.new('Менеджер Коля', 'менеджер')
goods1 = Goods.new('Хлеб', 0.7, 8)
goods2 = Goods.new('Пиво 05', 0.7, 12)
goods3 = Goods.new('Клубника 1кг', 1, 30)

DocumentSales1 = DocumentSales.new(1, Date.today, customer1, manager1)
DocumentSales1.add(goods1, 1)
DocumentSales1.add(goods2, 2)
DocumentSales1.add(goods3, 3)

DocumentSales2 = DocumentSales.new(2, Date.today, customer1, manager1)
DocumentSales2.add(goods1, 1)

DocumentSales3 = DocumentSales.new(3, Date.today, customer1, manager1)
DocumentSales3.add(goods2, 15)


puts "Всего humanодов: #{Human.count}"
Human.all.each { | obj| obj.info }

puts "Всего товаров: #{Goods.count}"
Goods.all.each { | obj| obj.info }

puts "Всего документов: #{DocumentSales.count}"
DocumentSales.all.each { | obj| obj.info }

puts "Всего продаж: #{DocumentSalesGoods.count}"
DocumentSalesGoods.all.each { | obj| obj.info }

nil
