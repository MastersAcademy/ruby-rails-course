class Human
  attr_accessor :name, :age
  
  def initialize(name = 'default',age = '0')
    @name = name
    @age = age
    @satiety = 100
    puts 'Hello, I am ' + @name
  end
  
  def eat
    puts 'I am eating now'
  end
  
  def work   
    puts 'I am working now'
  end
  
  def voice
    puts 'mommy'
  end
  
  def are_you_hungry?
    puts 'my satiety is ' + @satiety.to_s + '%'
  end
  
end

class Client < Human
  attr_accessor :money
  
  def initialize(name = 'default',age = '0')
    super
    @order = []
  end

  def to_pay(sum)
    @money = @money - sum
    puts 'Client -> Ok, please.. now I have -' + @money.to_s + ' $'
  end
  
  def product_select(product)
    @order.push product
    puts 'Client -> I want -' + (product.name).to_s
  end
  
  def voice
    puts 'Client -> Can you give me it?'
    @order
  end
  
end

class Seller < Human
    
  def initialize(name = 'default',age = '0')
    super
    @price = 0
  end 
  
  def prepare_the_order(order)
    puts 'Seller -> Ok, I can do it'
    
    order.each do |value|
      @price += (value.price).to_i
    end
  end
  
  def sum_for_order
    puts 'Seller -> Please give me '+@price.to_s+' $' 
  end
   
  def check
    @price
  end
  
end

class Product
  attr_accessor :name, :price, :storage_life
  def initialize(name = 'default', price = '0', storage_life = '0')
    @price = price
    @name = name
  end
  
  def hour_ended
    @storage_life -= 1
    
    if @storage_life < 0
      puts 'spoiled product'
    end
    
  end
  
end

product1 = Product.new('Дабл Чизбургер', '60', '3')
product2 = Product.new('МакЧикен', '40', '2')
product3 = Product.new('БигМак', '30', '6')
product4 = Product.new('Мороженное маленькое', '15', '2')
product5 = Product.new('Мороженное большое', '30', '2')

client1 = Client.new('Oleg','12')
client1.money = 100

seller1 = Seller.new('Alex', '15')

client1.product_select(product2)
client1.product_select(product3)

seller1.prepare_the_order(client1.voice)
seller1.sum_for_order

client1.to_pay(seller1.check)

