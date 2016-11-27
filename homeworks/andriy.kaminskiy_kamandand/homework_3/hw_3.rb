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
  def get_age
    return @age
  end
  def d_therapist
    puts "\nHi! I'm your therapist. What are the symptoms?"
    p_case=Case.new(gets.to_s)
    p_case.get_case
    puts "Ok"
    puts p_case.inspect
  end
  def d_pediatrician
    puts "\nHi! I'm your pediatrician. Don't worry, I will heal you. What are the symptoms?"
    p_case=Case.new(gets.to_s)
    p_case.get_case
    puts "Ok"
    puts p_case.inspect
  end
end
class Doctor < Patient
  attr_accessor :prescription
  def initialize(prescription)
    @precepition=prescription
  end
  def get_prescription
    return @prescription
  end
end
class Case < Doctor
  attr_accessor :a_case
  def initialize(a_case)
    @case=a_case
  end
  def get_case
    return @case
  end
end
count=Registry.new(0)
patient=Patient.new(gets.to_i)
if patient.get_age > 16
  then adult=Patient.new(patient.get_age)
  puts patient.inspect
  puts "You need to consult a therapist"
  adult.d_therapist
  else child=Patient.new(patient.get_age)
  puts "You need to consult a pedistrician"
  child.d_pediatrician
end
puts "I'll write a prescription"
prescription=Doctor.new(gets.to_s)
prescription.get_prescription
puts prescription.inspect
count.sum
puts count.inspect