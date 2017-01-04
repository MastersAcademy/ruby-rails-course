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
  
  def choose_another_products(pr_name)
    puts "But He find another interesting to him product - #{pr_name}"
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
	
class Storage

  attr_reader :pr_name, :pr_code, :loaders
    
  def initialize(pr_name, pr_code, loaders)
    @pr_name = pr_name
    @pr_code = pr_code
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
stor_empl= Storage.new('Notebook', 'abc123', 'Bil and Bob')
stor_empl = Storage.new('Mobile Phone', 'def567', 'Bil and Bob')
stor_empl = Storage.new('Refrigerator', 'zxc987', 'Bil and Bob')

puts '============================'
puts '         Net Store'
puts '============================'

jacob.choose_product('Jackson', 'Notebook')
jacob.login_in('Jackson', "'JayJay'")
jacob.make_order('Jackson', 'Notebook')
john.check_order('Smith', "'JayJay'")
john.inquiry('Smith', 'Notebook')
john.transfer('Smith')
stor_empl.order_formation('Bil and Bob', 'Jackson', 'abc123')
davis.choose_product('Thomson', 'Mobile Phone')
davis.choose_another_products('Refrigerator')
davis.login_in('Thomson', "'DonT'")
davis.make_order('Thomson', 'Mobile Phone and Refrigerator')
john.check_order('Smith', "'DonT'")
john.inquiry('Smith', 'Mobile Phone and Refrigerator')
john.transfer('Smith')
stor_empl.order_delivery('Notebook', 'Jackson')
stor_empl.order_formation('Bil and Bob', 'Thomson', 'def567 and zxc987')
jacob.take_product('Jackson', 'Notebook')
stor_empl.order_delivery('Mobile Phone and Refrigerator', 'Thomson')
davis.take_product('Thomson', 'Mobile Phone and Refrigerator')
puts