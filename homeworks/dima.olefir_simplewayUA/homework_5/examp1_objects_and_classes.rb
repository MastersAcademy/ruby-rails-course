#Homework_5
puts "Здравствуйте, Ваш номер карты?"

module Receptionist

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

module Patient

  def medical_record
    puts ""
    puts "Данные по мед. карте № #{@id_card}"
    puts "#{@last_name} #{@first_name}"
    puts "#{@location}"
    puts "#{@medical_history}"
    puts ""
  end
end

module Doctor

def initialize(consulting_room = "12",
                name_doctor = "Ай-Болит",
                recording_disease = "таблетку")
  @consulting_room = consulting_room
  @name_doctor = name_doctor
  @recording_disease = recording_disease
end

  def visit
    puts "Кабинет №#{@consulting_room}, врач #{@name_doctor}"
  #work with the patient
    puts "Врач вызывает пациента #{@last_name} #{@first_name} !"
    puts ""
    puts "Осмотр пациента"
    puts "Боль в животе, врач назначил #{@recording_disease}"
    puts "========================================"
  end
end

module Check
  attr_accessor :date, :time, :price

  def issue_check
    puts " Дата: #{@date}"
    puts "Время: #{@time}"
    puts " Цена: #{@price}"
  end
end

class Info
  include Receptionist
  include Patient
end

class Info_two
  include Doctor
  include Check
end

salute = Info.new
salute.say_hi

record = Info.new
record.medical_record

treatment = Info_two.new
treatment.visit

issue = Info_two.new
issue.date = "12.11.2016"
issue.time = "19:00"
issue.price = "150 грн."
issue.issue_check