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

module Laboratory
  def medical_chekup(test_1)
    @test = test_1
  end
  def test_result
    return @test.to_i
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

class Patient
  extend Registry
  attr_accessor :age
  puts 'Enter you age, please:'
  def initialize(age)
    @age = age
  end
end

class Therapist
  extend Registry
  include EPatient
  extend Laboratory
  include Prescription
  def d_therapist
    puts "\nHi! I'm your therapist. What are the symptoms?"
  end
end

class Pediatrician
  extend Registry
  include EPatient
  extend Laboratory
  def d_pediatrician
    puts "\nHi! I'm your pediatrician. Don't worry, I will heal you. What are the symptoms?"
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
    puts 'You need to consult a therapist'
    adult = Therapist.new
    adult.d_therapist
    Therapist.begin(0)
    Therapist.new.ep_case
    puts "The number of examined by a Therapist patients during the day: #{Therapist.sum}."
    puts "\nNow we need to check your labs. Enter any digit, please:"
    Therapist.medical_chekup(gets)
  else puts 'You need to consult a pedistrician'
    child = Pediatrician.new
    child.d_pediatrician
    Pediatrician.begin(0)
    Pediatrician.new.ep_case
    puts "The number of examined by a Pediatrician patients during the day: #{Pediatrician.sum}."
    puts "\nNow we need to check your labs. Enter any digit, please:"
    Pediatrician.medical_chekup(gets)
end

if Therapist.test_result > 5 or Pediatrician.test_result > 5
  Therapist.new.gives_prescription
    if Therapist.test_result == 6 or Pediatrician.test_result == 6
      Therapist.new.gives_prescription1
    end
    if Therapist.test_result == 7 or Pediatrician.test_result == 7
      Therapist.new.gives_prescription2
    end
    if Therapist.test_result == 8 or Pediatrician.test_result == 8
      Therapist.new.gives_prescription3
    end
    if Therapist.test_result == 9 or Pediatrician.test_result == 9
      Therapist.new.gives_prescription4
    end
  else puts "\nTests have shown that You are healthy.\nYou are just overtired and need REST."
end

puts
puts "The number of examined patients during the day: #{Patient.sum}."