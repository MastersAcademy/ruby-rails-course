$patient_record = []

class Patient

  attr_reader :p_id, :p_lastname, :p_firstname, :p_age

  def initialize
    @p_id = p_id
    @p_lastname = p_lastname
    @p_firstname = p_firstname
    @p_age = p_age
   end
end

class Registry < Patient

  attr_reader :insuranc_number

  def initialize
    super
    @insuranc_number = insuranc_number
  end

  def registration_card(p_id, p_lastname, p_firstname, p_age, insuranc_number)
    info_p = p_id, p_lastname, p_firstname, p_age, insuranc_number
    $patient_record << info_p
    puts "Patient #{p_lastname} #{p_firstname} registration is successful"
  end

  def visit_p(p_lastname, p_firstname)
    puts "Visit #{p_lastname} #{p_firstname} to Hospital"
  end

  # Print ambulatory patient cards

  def print_card(p_id, p_lastname, p_firstname, insuranc_number)
    puts "Print patient card #{p_id} #{p_lastname} #{p_firstname} #{insuranc_number}"
  end

  # Search patient for medical card number

  def serch_patient(p_id)
    puts "Found the patient with a card number #{p_id}"
  end

  # Formation order for the patient

  def order_p(p_id, p_lastname, p_firstname, name_admission, data_admission)
    puts "Created order #{p_id} #{p_lastname} #{p_firstname} #{name_admission} #{data_admission}"
  end
end

class Doctor

  attr_reader :id_d, :name_doctor

  def card_doctor(name_doctor, id_d)
    puts "Registration card doctor #{name_doctor} number #{id_d}"
  end

  def view_patient_data(p_lastname, p_firstname)
    puts "Viewing medical card about patient #{p_lastname} #{p_firstname}"
  end

  def establishing_diagnosis
    puts "Establishing diagnosis for the patient"

  end

  def drugs
    puts "The appointment of drugs"
  end
end

class Admission_department < Patient

  attr_reader :name_admission, :data_admission

  def initialize
    super
    @name_admission = name_admission
    @data_admission = data_admission
  end

  def register_hospitalization(data_admission)
   puts "Registration patient to hospitalization #{data_admission}"
  end

  def report_department
    puts "Report admission departments"
  end
end


var1 = Patient.new
var2 = Registry.new
var3 = Admission_department.new
var4 = Doctor.new

puts "-------------Hospital----------------"

var2.registration_card('155', 'Ivanov', 'Ivan', '46', 'AE22')
var2.visit_p('Zabelin', 'Victor')
var2.print_card('2350', 'Zaykina', 'Elena', 'AE100')
var2.serch_patient('56')
var2.order_p('155', 'Ivanov', 'Ivan', '"therapist admission"', '12.08.2016 years')
var3.register_hospitalization('05.03.2014 years')
var4.card_doctor('Filimonov V.M', '0012')
var4.view_patient_data('Kubik', 'Olga')