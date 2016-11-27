class Registry
  attr_accessor :count
  def initialize(count)
    @count=count
  end
  def sum
    @count+=1
  end
end
class Patient
  attr_accessor :age
  puts "Enter you age, please?"
  def initialize(age)
    @age=age
  end
  def d_therapist
    puts "\nHi! I'm your therapist. What are the symptoms?"
    p_case=Case.new(gets.to_s)
    p_case.case_history
    puts "Ok"
    puts p_case.inspect
  end
  def d_pediatrician
    puts "\nHi! I'm your pediatrician. Don't worry, I will heal you. What are the symptoms?"
    p_case=Case.new(gets.to_s)
    p_case.case_history
    puts "Ok"
    puts p_case.inspect
  end
end
class Doctor < Patient
  attr_accessor :prescription
  def initialize(prescription)
    @precepition=prescription
  end
end
class Case < Doctor
  attr_accessor :case_history
  def initialize(case_history)
    @case_history=case_history
  end
end
count=Registry.new(0)
patient=Patient.new(gets.to_i)
if patient.age > 16
    adult=Patient.new(patient.age)
    puts patient.inspect
    puts "You need to consult a therapist"
    adult.d_therapist
  else child=Patient.new(patient.age)
    puts "You need to consult a pedistrician"
    child.d_pediatrician
end
puts "I'll write a prescription"
prescription_1=Doctor.new(gets.to_s)
prescription_1.prescription
puts prescription_1.inspect
count.sum
puts count.inspect