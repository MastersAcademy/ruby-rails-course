# homework 5
# Ruby example crm

module InstanceDescription
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

module ClassDescription
  def all
    ObjectSpace.each_object(self).to_a
  end

  def count
    if self.class_variable_defined?(:@@counter)
      self.class_variable_get(:@@counter)
    else
      all.count
    end
  end
end

class Human
  attr_accessor :comment
  attr_reader :name
  include InstanceDescription
  extend ClassDescription

  def initialize(name, comment)
    @name = name
    @comment = name
  end
end

class Goods
  attr_accessor :price
  attr_reader :name, :weight
  include InstanceDescription
  extend ClassDescription

  def initialize(name, weight, price)
    @name = name
    @weight = weight
    @price = price
  end
end

class DocumentSales
  attr_accessor :sales_good
  attr_reader :number, :date, :customer, :manager, :sum
  include InstanceDescription
  extend ClassDescription
  @@counter = 0

  def initialize(customer, manager)
    @date = Time.now
    @customer = customer
    @manager = manager
    @sum = 0
    @number = "%06d" % @@counter += 1
    @sales_good = []
  end

  def add(goods, amount)
    @sales_good << DocumentSalesGoods.new(self, goods, amount, goods.price)
    @sum += goods.price * amount
  end
end

class DocumentSalesGoods
  attr_reader :document_sales, :goods, :amount, :price
  include InstanceDescription
  extend ClassDescription

  def initialize(document_sales, goods, amount, price)
    @document_sales = document_sales
    @goods = goods
    @amount = amount
    @price = price
  end
end

def add_document_sales(customer, manager, mas_goods)
  new_document_sales = DocumentSales.new(customer, manager)
  mas_goods.each { |el| new_document_sales.add(el[0],el[1]) }
end

customer = Human.new('Покупатель 1', 'покупатель')
manager = Human.new('Менеджер Коля', 'менеджер')
goods1 = Goods.new('Хлеб', 0.7, 10)
goods2 = Goods.new('Пиво 05', 0.7, 15)
goods3 = Goods.new('Клубника 1кг', 1, 30)

add_document_sales(customer, manager, [[goods1, 1], [goods2, 2], [goods3, 4]])
add_document_sales(customer, manager, [[goods1, 1]])
add_document_sales(customer, manager, [[goods2, 15]])

puts "Всего humanоидов: #{Human.count}"
Human.all.each { | obj| obj.info }
puts "Всего товаров: #{Goods.count}"
Goods.all.each { | obj| obj.info }
puts "Всего документов: #{DocumentSales.count}"
DocumentSales.all.each { | obj| obj.info }
