# homework 6
# Ruby example crm
#
require 'date'

class PriceError < StandardError
  attr_accessor :retry
  def initialize(obj)
    # super(obj)
    puts "Для номенклатуры '#{obj.name}' не указана цена. Указать сейчас? y/n"
    result = gets.chop
    @retry = result=="y" || result.empty?
  end

end

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
    if self.class_variable_defined?(:@@counter)
      self.class_variable_get :@@counter
    else
      all.count
    end
  end

end

class Human
  attr_accessor :comment
  attr_reader :name
  include Instance_description
  extend Class_description

  def initialize(name, comment)
    @name, @comment = name, comment
  end

end

class Goods
  attr_accessor :price
  attr_reader :name, :weight
  include Instance_description
  extend Class_description

  def initialize(name, weight, price)
    @name, @weight, @price = name, weight, price
  end

end

class DocumentSales
  attr_accessor :salesGood
  attr_reader :number, :date, :customer, :manager, :sum
  include Instance_description
  extend Class_description
  @@counter = 0

  def initialize(date, customer, manager)
    @number = "%06d" % @@counter += 1
    @date, @customer, @manager = date, customer, manager
    @salesGood, @sum= [], 0
  end

  def add(goods, amount)
    raise PriceError.new(goods) if goods.price == 0 || (goods.price.class.ancestors.include?( Numeric )) == false
  rescue PriceError => e
    if e.retry then
      puts "Актуальная цена номенклатуры '#{goods.name}':"
      goods.price = gets.chop.to_i
      retry
    end
  else
    @salesGood << DocumentSalesGoods.new(self, goods, amount, goods.price)
    @sum += goods.price * amount
  end

end

class DocumentSalesGoods
  attr_reader :documentSales, :goods, :amount, :price
  include Instance_description
  extend Class_description

  def initialize(documentSales, goods, amount, price)
    @documentSales, @goods, @amount, @price = documentSales, goods, amount, price
  end

end

def add_document_sales(date, customer, manager, mas_goods)

  new_document_sales = DocumentSales.new(date, customer, manager)
  mas_goods.each { |el| new_document_sales.add(el[0],el[1]) }

end

customer = Human.new('Покупатель 1', 'покупатель')
manager = Human.new('Менеджер Коля', 'менеджер')
goods1 = Goods.new('Хлеб', 0.7, 8)
goods2 = Goods.new('Пиво 05', 0.7, 15)
goods3 = Goods.new('Клубника 1кг', 1, 0)

add_document_sales(Date.today, customer, manager, [[goods1,1],[goods2,2],[goods3,4]])
add_document_sales(Date.today, customer, manager, [[goods1,1]])
add_document_sales(Date.today, customer, manager, [[goods2,15]])
puts "Всего humanоидов: #{Human.count}"
Human.all.each { | obj| obj.infouser rescue puts "Для humanоида '#{obj.name}' информация недоступна"}

puts "Всего товаров: #{Goods.count}"
# Goods.all.each { | obj| obj.info }

puts "Всего документов: #{DocumentSales.count}"
DocumentSales.all.each { | obj| obj.info }

