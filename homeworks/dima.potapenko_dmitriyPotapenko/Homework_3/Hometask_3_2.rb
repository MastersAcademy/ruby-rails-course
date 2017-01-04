# Hometask_3_Net_Store

class Client
  
  attr_reader :cl_surname, :nikname
  
  def initialize(cl_surname, nikname)
    @cl_surname = cl_surname
    @nikname = nikname
  end
    
  def choose_product(cl_surname, pr_name)
    puts "#{cl_surname} find #{pr_name} in Net Store"
  end
 
  def login_in(cl_surname, nikname)
    puts "#{cl_surname} sign in on web site as #{nikname}"
  end
  
  def make_order(cl_surname, pr_name)
    puts "#{cl_surname} order #{pr_name}"
  end

  def take_product(cl_surname, pr_name)
    puts "#{cl_surname} take #{pr_name} from the courier service"
  end
end

class Store
    
  attr_reader :empl_surname
    
  def initialize(empl_surname)
    @emp_surname = empl_surname
  end
  
  def check_order(empl_surname, nikname)
    puts "Employee of the store, #{empl_surname}, check order from user #{nikname}" 
  end
  
  def inquiry(empl_surname, pr_name)
    puts "#{empl_surname} check availability of #{pr_name} by product code in storage"
  end
  
  def transfer(empl_surname)
    puts "#{empl_surname} gives a new order to storage"
  end
end
	
class Goods
  
  attr_reader :pr_name, :pr_code
  
  def initialize(pr_name, pr_code)
    @pr_name = pr_name
    @pr_code = pr_code
  end
end
	
class Storage

  attr_reader :loaders
    
  def initialize(loaders)
    @loaders = loaders
  end
  
  def order_formation(loaders, cl_surname, pr_code)
    puts "#{loaders} collect order for #{cl_surname} by product code #{pr_code}"
  end
    
  def order_delivery(pr_name, cl_surname)
    puts "Storage ordered delivery #{pr_name} to #{cl_surname}"
  end
end

puts ''    
jacob = Client.new('Jackson', "'JayJay'")
davis = Client.new('Thomson', "'DonT'")
john = Store.new('Smith')
stor_empl= Storage.new "Bil and Bob"
product1 = Goods.new "Notebook", "aaa111"
product2 = Goods.new "Mobile Phone", "bbb222"

puts '============================'
puts '         Net Store'
puts '============================'

jacob.choose_product('Jackson', 'Notebook')
jacob.login_in('Jackson', "'JayJay'")
jacob.make_order('Jackson', 'Notebook')
john.check_order('Smith', "'JayJay'")
john.inquiry('Smith', 'Notebook')
john.transfer('Smith')
stor_empl.order_formation('Bil and Bob', 'Jackson', 'aaa111')
davis.choose_product('Thomson', 'Mobile Phone')
davis.login_in('Thomson', "'DonT'")
davis.make_order('Thomson', 'Mobile Phone')
john.check_order('Smith', "'DonT'")
john.inquiry('Smith', 'Mobile Phone')
john.transfer('Smith')
stor_empl.order_delivery('Notebook', 'Jackson')
stor_empl.order_formation('Bil and Bob', 'Thomson', 'bbb222')
jacob.take_product('Jackson', 'Notebook')
stor_empl.order_delivery('Mobile Phone', 'Thomson')
davis.take_product('Thomson', 'Mobile Phone')
puts