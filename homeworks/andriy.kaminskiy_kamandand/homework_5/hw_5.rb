module Registry
  def begin(count)
    @count = count
  end
  def sum
    @count += 1
  end
end
module EPatient
  def ep_case
    p_case = Case.new(gets.to_s)
    p_case.case_history
    puts 'Ok.'
    puts p_case.inspect
  end
end
class Patient
  extend EPatient
  extend Registry
  attr_accessor :age
  puts 'Enter you age, please:'
  def initialize(age)
    @age = age
  end
  def d_therapist
    puts "\nHi! I'm your therapist. What are the symptoms?"
    Patient.ep_case
  end
  def d_pediatrician
    puts "\nHi! I'm your pediatrician. Don't worry, I will heal you. What are the symptoms?"
    Patient.ep_case
  end
end
module Prescription
  def gives_prescription
    puts "\nTests have shown that You are a little bit sick \nand You will need to take medication.\nHere is Your PRESCRIPTION."
  end
  def gives_prescription1
    puts 'PRESCRIPTION 1:'
  end
  def gives_prescription2
    puts 'PRESCRIPTION 2:'
  end
  def gives_prescription3
    puts 'PRESCRIPTION 3:'
  end
  def gives_prescription4
    puts 'PRESCRIPTION 4:'
  end
end
class Doctor
  include Prescription
  def medical_chekup(test_1)
    @test = test_1
  end
  def test_result
    return @test
  end
end
class Case
  attr_accessor :case_history
  def initialize(case_history)
    @case_history = case_history
  end
end
Patient.begin(0)
patient = Patient.new(gets.to_i)
if patient.age > 16
  adult = Patient.new(patient.age)
  puts patient.inspect
  puts 'You need to consult a therapist'
  adult.d_therapist
else child = Patient.new(patient.age)
puts 'You need to consult a pedistrician'
child.d_pediatrician
end
puts "\nNow we need to check your labs. Enter any digit, please:"
test1 = Doctor.new
test1.medical_chekup(gets.to_i)
if test1.test_result > 5
  Doctor.new.gives_prescription
  if test1.test_result == 6
    Doctor.new.gives_prescription1
  end
  if test1.test_result == 7
    Doctor.new.gives_prescription2
  end
  if test1.test_result == 8
    Doctor.new.gives_prescription3
  end
  if test1.test_result == 9
    Doctor.new.gives_prescription4
  end
  else puts "\nTests have shown that You are healthy.\nYou are just overtired and need REST."
end
puts
puts "The number of examined patients during the day: #{Patient.sum}."