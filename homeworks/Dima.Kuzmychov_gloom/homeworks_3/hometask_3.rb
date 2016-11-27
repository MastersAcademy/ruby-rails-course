# Hometask_3_Telephone_communications_center

class Callers
  
  attr_reader :surname, :name, :date_of_birth, :a_division_of
  
  def initialize(surname, name, date_of_birth, a_division_of)
    @surname = surname
    @name = name
    @date_of_birth = date_of_birth
    @a_division_of = a_division_of
  end
    
  def choose_info_about_callers(surname, name, date_of_birth)
    puts "#{surname} #{name} #{date_of_birth} subscriber in telephone communications center"
  end
  
  def choose_number_unit(a_division_of)
    puts "subscriber numbers is #{a_division_of}"
  end
end

class Unit
    
  attr_reader :un_name, :kind_of_division
    
  def initialize(un_name, kind_of_division)
    @un_name = un_name
    @kind_of_division = kind_of_division
  end
  
  def check_subscribers(surname, name, un_name, kind_of_division)
    puts "Subscriber #{surname} #{name} is sitting in #{un_name} #{kind_of_division} " 
  end
end
	
class Room
  
  attr_reader :room_number
  
  def initialize(surname, name, un_name, kind_of_division, room_number)
    @room_number = room_number
  end
  
  def room_number_subscriber(surname, name, un_name, kind_of_division, room_number)
    puts "Subscriber #{surname} #{name} from #{un_name} #{kind_of_division} is sitting in #{room_number} room" 
  end
end
	

puts ''    
info_1 = Callers.new('Brom', 'Yriu', '10.11.2000', "'152'")
info_2 = Callers.new('Heroshi', 'Slavik', '18.09.2001', "'134'")
info_ceh_1 = Unit.new('manufactory', 'electric power supply')
info_ceh_2 = Unit.new('manufactory', 'IT')
info_room_1 = Room.new('Brom', 'Yriu', 'manufactory', 'electric power supply', "'107'")
info_room_2 = Room.new('Heroshi', 'Slavik', 'manufactory', 'IT', "'314'")

info_1.choose_info_about_callers('Brom', 'Yriu', '10.11.2000')
info_2.choose_number_unit("'152'")
info_1.choose_info_about_callers('Heroshi', 'Slavik', '18.09.2001')
info_2.choose_number_unit("'134'")
info_ceh_1.check_subscribers('Brom', 'Yriu','manufactory', 'electric power supply')
info_ceh_2.check_subscribers('Heroshi', 'Slavik', 'manufactory', 'IT')
info_room_1.room_number_subscriber('Brom', 'Yriu', 'manufactory', 'electric power supply', "'107'")
info_room_2.room_number_subscriber('Heroshi', 'Slavik', 'manufactory', 'IT', "'314'")

puts