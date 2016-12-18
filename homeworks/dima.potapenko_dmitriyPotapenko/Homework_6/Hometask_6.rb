# Hometask_6_(exceptions)

module ClientChoice
  
  def choose_product(cl_surname, pr_name)
    puts "#{cl_surname} find #{pr_name} in Net Store"
  end
  
  def leave_store
    puts "Client leave Net Store"
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
  
  def main
    
    begin
      puts "Welcome to the 'Net Store'\nEnter - 1 to choose product or 2 for Exit "
      choice = gets.to_i
      case choice

      when 1
        puts "Client begin looking for product"
        
        jacob = Client.new
        john = Store.new
        
        jacob.choose_product('Jackson', 'Notebook')
        jacob.login_in('Jackson', "'JayJay'", 'Notebook')
        john.check_order('Smith', "'JayJay'", 'Notebook')
        john.transfer('Smith')
        john.order_formation('Bil and Bob', 'Jackson', 'abc123', 'Notebook')
        john.transfer('Smith')
        jacob.take_product('Jackson', 'Notebook')
        
      when 2
        puts "Client choose searching in another store"
        leave_store
      
      else
        if [1,2].include? choiсe
        raise "Try again!"
        end
      end
    rescue StandardError
      puts "Oops this category is absent"
      retry
    end
  end
end
  
class Store

  include StoreEmployee
  include StorageWorker
  
end

puts '-= Net Store =-'

Client.new.main