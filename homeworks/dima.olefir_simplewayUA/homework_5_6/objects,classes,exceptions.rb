# Hospital
puts "Здравствуйте, Ваш номер карты?"

module Describer
  
  def describe(description)
    puts @description = description
  end
end

module Inspection
  def number(value)
    raise MyError.new("Error! The '#{@value}' must be a number and greater than zero.") unless value.respond_to?(:to_i) && value.to_i > 0
  end
end

class MyError < StandardError
  def initialize(msg = "Error!")
    super(msg)
  end
end

class Receptionist
  include Describer
  include Inspection

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

  def say_hi(id_card = 2913)
    begin
      number(id_card)
    rescue MyError
      @id_card = 2913
    else
      @id_card = id_card
    end
    describe "Номер моей карты, - #{id_card}!"
  end
end

class Patient < Receptionist
  include Describer

  def medical_record
    describe "Данные по мед. карте № #{@id_card}\n#{@last_name} #{@first_name}\n#{@location}\n#{@medical_history}"  
  end
end

class Doctor < Receptionist
  include Describer

  def initialize(consulting_room = "12",
                  name_doctor = "Ай-Болит",
                  recording_disease = "таблетку")
    @consulting_room = consulting_room
    @name_doctor = name_doctor
    @recording_disease = recording_disease
  end

  def visit
    describe "Кабинет №#{@consulting_room}, врач #{@name_doctor}\nВрач вызывает пациента #{@last_name} #{@first_name}!"
  end

  def review
    describe "Осмотр пациента\nБоль в животе, врач назначил #{@recording_disease}"
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
    raise MyError, "Price can't be less"
    rescue MyError => e
    puts e.message
    puts " Дата: #{@date}"
    puts "Время: #{@time}"
    puts " Цена: #{@price}"
  end
end

salute = Receptionist.new
salute.say_hi

hello = Patient.new
hello.medical_record

doc = Doctor.new
doc.visit
doc.review

issue = Check.new('12.11.2016', '19:00', '150 грн.')
issue.issue_check