# Hometask_5 

module ClientChoice
  
  def choose_product(cl_surname, pr_name)
    puts "#{cl_surname} find #{pr_name} in Net Store"
  end
  
  def choose_another_products(pr_name)
    puts "But He find another interesting to him product - #{pr_name}"
  end
  
end

module ClientMakeOrder
  
  def login_in(cl_surname, nikname, pr_name)
    puts "#{cl_surname} sign in on web site as #{nikname}"
    puts "#{cl_surname} order #{pr_name}"
  end 
  
  def take_product(cl_surname, pr_name)
    puts "#{cl_surname} take #{pr_name} from the courier service"
  end
  
end

module StoreEmployee
  
   def check_order(empl_surname, nikname, pr_name)
    puts "Employee of the store, #{empl_surname}, check order from user #{nikname}" 
    puts "#{empl_surname} check availability of #{pr_name} by product code in storage"
  end
  
  def transfer(empl_surname)
    puts "#{empl_surname} gives a new order to storage"
  end

end

module StorageWorker
  
  def order_formation(loaders, cl_surname, pr_code, pr_name)
    puts "#{loaders} collect order for #{cl_surname} by product code #{pr_code}"
    puts "Storage ordered delivery #{pr_name} to #{cl_surname}"
  end
  
end

class Client
  
  include ClientChoice
  include ClientMakeOrder
  
end

class Store

  include StoreEmployee
  include StorageWorker
  
end
  
jacob = Client.new
davis = Client.new
john = Store.new

puts '-= Net Store =-'

jacob.choose_product('Jackson', 'Notebook')
jacob.login_in('Jackson', "'JayJay'", 'Notebook')
john.check_order('Smith', "'JayJay'", 'Notebook')
john.transfer('Smith')
john.order_formation('Bil and Bob', 'Jackson', 'abc123', 'Notebook')
davis.choose_product('Thomson', 'Mobile Phone')
davis.choose_another_products('Refrigerator')
davis.login_in('Thomson', "'DonT'", 'Mobile Phone and Refrigerator')
john.check_order('Smith', "'DonT'", 'Mobile Phone and Refrigerator')
john.transfer('Smith')
john.order_formation('Bil and Bob', 'Thomson', 'def567 and zxc987', 'Mobile Phone and Refrigerator')
jacob.take_product('Jackson', 'Notebook')
davis.take_product('Thomson', 'Mobile Phone and Refrigerator')