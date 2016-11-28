#Паттерн Mediator - менеджер является посредником
#между посылкой, отправителем и получателем.

class Sender

  attr_accessor :name, :surname, :adress
  
  def initialize(name, surname, adress)
    @name = name
    @surname = surname 
    @adress = adress
    puts "Sender #{name} come to Ukrpost"
  end
  
  def oplata(cost)
    if cost == 10
    puts "#{name} you paid #{cost} grn"
    else
    puts "#{name} shipping costs #{cost} grn"
    end
  end
  
end


class Reciplient

  attr_accessor :name, :surname, :adress
  
  def initialize(name, surname, adress)
    @name = name
    @surname = surname 
    @adress = adress

    puts "Respected #{name} #{surname} you sent parcel to #{adress}"
  end

  def status(stat)
    @stat = stat
    if @stat == 'true'
    puts "Your parcel arrived"
    else
    puts "Wait, parcel not yet come" 
    end
  end

end

class Manager

  attr_accessor :name
  
  def initialize(name)
    @name = name

    puts "My name is #{name}, wellcome in Ukrpost"
  end
  
  def doc(rec_doc, verdoc)
    @rec_doc = rec_doc
    @verdoc = verdoc
    if 'rec_doc' == 'verdoc'
    puts "Identity determined. Take your parcel!"
    else
    puts "Now call the police, go here!"
    end
  end
  
end
sender1 = Sender.new('Sergey', 'Ripchanskiy', 'Cherkassy') 
sender1.oplata(10)
reciplient1 = Reciplient.new('Ivan', 'Dudin', 'Kirovograd') 
reciplient1.status("true")
manager1 = Manager.new('Marina')
manager1.doc("MS341232", "MS341232")