# Hospital
puts "Здравствуйте, Ваш номер карты?"

class Receptionist
  attr_reader :last_name, :first_name, :location, :medical_history, :id_card

  def initialize( id_card = "2913",
                  last_name = "Петрович",
                  first_name = "Петр",
                  location = "Черкасская обл., Черкассы",
                  medical_history = "история больного(записи)")
    @id_card = id_card
    @last_name = last_name
    @first_name = first_name
    @location = location
    @medical_history = medical_history
  end
    
  def say_hi
    puts "Номер моей карты, - #{@id_card}!"
  end
end

class Patient < Receptionist

  def medical_record
    puts ""
    puts "Данные по мед. карте № #{@id_card}"
    puts "#{@last_name} #{@first_name}"
    puts "#{@location}"
    puts "#{@medical_history}"
    puts ""
  end
end

class Doctor
  attr_reader :consulting_room, :name_doctor, :recording_disease

def initialize(consulting_room = "12",
                name_doctor = "Ай-Болит",
                recording_disease = "таблетку")
  @consulting_room = consulting_room
  @name_doctor = name_doctor
  @recording_disease = recording_disease
end

  def visit
    puts "Кабинет №#{@consulting_room}, врач #{@name_doctor}"
  end

	#work with the patient
  def actions
    puts "Врач вызывает пациента #{@last_name} #{@first_name} !"
    puts ""
  end

  def review
    puts "Осмотр пациента"
    puts "Боль в животе, врач назначил #{@recording_disease}"
    puts "========================================"
  end
end

class Check
  attr_accessor :date, :time, :price

  def initialize(date, time, price)
    @date = date
    @time = time
    @price = price
  end

  def issue_check
    puts " Дата: #{@date}"
    puts "Время: #{@time}"
    puts " Цена: #{@price}"
  end
end

salute = Receptionist.new('2913')
salute.say_hi

record = Patient.new
record.medical_record

treatment = Doctor.new
treatment.visit
treatment.review

issue = Check.new('12.11.2016', '19:00', '150 грн.')
issue.issue_check
puts ""