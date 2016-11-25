# Ruby example crm

require 'date'

class Customer
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

class Manager
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

class Goods
  attr_reader :name, :weight, :price
  def initialize(name, weight, price)
    @name, @weight, @price = name, weight, price
  end
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
  
  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.count
    all.count
  end
end

class DocumentSalesGoods
  attr_reader :documentSales, :goods, :amount, :price
    def initialize(documentSales, goods, amount, price)
    @documentSales, @goods, @amount, @price = documentSales, goods, amount, price
  end
end

customer1 = Customer.new('Покупатель 1')
manager1 = Manager.new('Менеджер Коля')
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

puts "Всего документов: #{DocumentSales.count}"
total = 0
for docobj in DocumentSales.all
  puts ">> Документ #{docobj.number} (#{docobj.sum} грн.) " 
  docobj.salesGood.each { |i| puts " >#{i.goods.name} #{i.amount} шт. по #{i.price} грн." }
  total += docobj.sum
end
"Сумма итог: #{total} грн."
