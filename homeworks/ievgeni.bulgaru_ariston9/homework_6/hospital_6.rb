module CreatePatient

  attr_reader :p_id, :p_lastname, :p_firstname, :p_age, :insuranc_number

  def initialize
    @p_id = p_id
    @p_lastname = p_lastname
    @p_firstname = p_firstname
    @p_age = p_age
    @insuranc_number = insuranc_number
  end

  # Print ambulatory patient cards

  def print_card(p_id, p_lastname, p_firstname, insuranc_number)
    puts "Print patient card #{p_id} #{p_lastname} #{p_firstname} #{insuranc_number}"
  end

  # Search patient for medical card number

  def search_patient
    search = STDIN.gets.chomp
    raise ArgumentError.new("Patient of number must be integer") unless search.respond_to?(:to_i) && search.to_i > 0
    puts "Found the patient with a card number #{search}"
  end
end

module Order

  # Formation order for the patient
  def order_p(p_id, p_lastname, p_firstname, name_admission, data_admission)
    puts "Created order #{p_id} #{p_lastname} #{p_firstname} #{name_admission} #{data_admission}"
  end

  def invoice_payment
    puts "Create invoice for payment"
  end

end

module DocSet

  attr_accessor :operation, :number_protocol

  # To get a prescription for the patient
  def prescription(p_lastname, p_firstname, name_pr, dispense, refills)
    puts "Prescription for #{p_lastname} #{p_firstname} #{name_pr}
    dispense: #{dispense}
    refills: #{refills} "
  end

  def protocol_operation
    "Forming the protocol operation number #{number_protocol} for a patient"
  end

  def examination(inspection)
    puts "Doctor found a patient #{inspection}"
  end
end

module AdditionDoc

  # Offers the possibility of ordering a patient without insurance policy
  def self.included(not_invoice)
    not_invoice.extend(DocSet)
  end
end

class Registry

  include CreatePatient
  extend Order

  def registration_card
    @patient_record = []

    info_p = STDIN.gets.chomp.strip

    if @patient_record != info_p
      @patient_record << info_p
      puts "Patient #{info_p} registration is successful"
    else
      puts "Patient #{info_p} is already registered "
    end
  end


  def visit_p(p_lastname, p_firstname)
    puts "Visit #{p_lastname} #{p_firstname} to Hospital"
  end
end


class Doctor

  include CreatePatient
  include DocSet

  attr_accessor :id_d, :name_doctor

  def card_doctor(name_doctor, id_d)
    puts "Registration card doctor #{name_doctor} number #{id_d}"
  end

  def view_patient_data(p_lastname, p_firstname)
    puts "Viewing medical card about patient #{p_lastname} #{p_firstname}"
  end

  # Patient examination
  def perform_examination
    examination

  rescue ArgumentError
    puts "Please, to choose necessary method for inspection a patient"
  end


  def establishing_diagnosis
    puts "Establishing diagnosis for the patient"
  end

  def drugs
    puts "The appointment of drugs"
  end
end


class Admission_department

  include CreatePatient
  include DocSet

  attr_reader :name_admission, :data_admission

  def initialize
    @name_admission = name_admission
    @data_admission = data_admission
  end

  def register_hospitalization
    @data_admission = Time.new(2012, 10, 05)
    puts "Registration patient to hospitalization #{@data_admission}"
  end

  def report_department
    puts "Report admission departments"
  end
end

Admission_department.class_eval do

  def patient_discharge
    @time = Time.new(2016, 05, 20)
    "Register the patient for discharge #{@time}"
  end
end

var2 = Registry.new
var3 = Admission_department.new
var4 = Doctor.new

puts "-------------Hospital----------------"

begin
  puts "Search patient for a card number: "
  var2.search_patient
   rescue Exception => error
  puts "Input error"
  p error.message
  p error.backtrace
ensure
  sleep 2
  puts "Registration of patient. Input a Last Name: "
  var2.registration_card
  var2.visit_p('Zabelin', 'Victor')
  var2.print_card('2350', 'Zaykina', 'Elena', 'AE100')
  Registry.order_p('155', 'Ivanov', 'Ivan', '"therapist admission"', '12.08.2016 years')
  var3.register_hospitalization
  var4.card_doctor('Filimonov V.M', '0012')
  var4.view_patient_data('Babay', 'Olga')
  var4.prescription('Trial', 'Jhon', 'Analgin 20mg Tablet (Oral) daily', '10 pills', '2')
  var4.number_protocol = object_id
  puts var4.protocol_operation
  puts var3.patient_discharge
  p "___________Display Error____________"
  var4.perform_examination
end





