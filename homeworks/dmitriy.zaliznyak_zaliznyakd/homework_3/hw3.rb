puts "Home work 3"
puts "========================================"

class Student
  attr_reader :id, :fio, :birth, :adress

  def initialize(id, fio, birth, adress)
    @id = id
    @fio = fio
    @birth = birth
    @adress = adress
  end

  def student_base(id, fio, birth, adress)
    stud_b = id, fio, birth, adress
    puts "Student #{fio}"

  end
end

class Subject
  attr_reader :name_subject, :data


  def initialize(name_subject, data)
    @name_subject = name_subject
    @data = data
  end
  
  def subject_base(name_subject, data)
    puts "The time of subject #{name_subject} is #{data}"
    less_b = name_subject, data
  end

end


class Journal
  
  def attendance(id, fio, name_subject, data)
    attendance_base = id, fio, name_subject, data
  
    puts "Student #{fio} was present on subject #{@name_subject} on #{data}"
  end

end

class Teacher < Subject
  attr_reader :id, :fio 

    
  def teacher_card(fio, id)
    puts "Teacher of #{@name_subject} is #{fio} number #{id}"
  end

end




var1 = Student.new('25', 'Semenchenko Semen', '25.05.1995', 'Homenka 37 kv.4')
var2 = Teacher.new('History', '28.11.2016')
var3 = Subject.new('History', '28.11.2016')
var4 = Journal.new


var1.student_base('25', 'Semenchenko Semen', '25.05.1995', 'Homenka 37 kv.4')
var2.teacher_card('Guba Ivan Petrovich', '354657')
var3.subject_base('History', '28.11.2016')
puts var2.name_subject
var4.attendance('25', 'Semenchenko', 'History', '28.11.2016')