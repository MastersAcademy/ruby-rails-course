puts "Home work 3"
puts "========================================"

class Student
  attr_reader :stud_id, :stud_FIO, :stud_birth, :stud_adress

  def initialize(stud_id, stud_FIO, stud_birth, stud_adress)
    @stud_id = stud_id
    @stud_FIO = stud_FIO
    @stud_birth = stud_birth
    @stud_adress = stud_adress
  end

  def student_base(stud_id, stud_FIO, stud_birth, stud_adress)
    stud_b = stud_id, stud_FIO, stud_birth, stud_adress
    puts "Student #{stud_FIO}"

  end
end

class Lesson
  attr_reader :name_lesson, :data_lesson

  def initialize(name_lesson, data_lesson)
    @name_lesson = name_lesson
    @data_lesson = data_lesson
  end

  def lesson_base(name_lesson, data_lesson)
    puts "The time of lesson #{name_lesson} is #{data_lesson}"
    less_b = name_lesson, data_lesson
  end

end


class Journal
  
  def attendance(stud_id, stud_FIO, name_lesson, data_lesson)
    attendance_base = stud_id, stud_FIO, name_lesson, data_lesson
  
    puts "Student #{stud_FIO} was present on lesson #{name_lesson} on #{data_lesson}"
  end

end

class Teacher < Lesson
  attr_reader :teach_id, :teach_FIO 

    
  def teacher_card(teach_FIO, teach_id)
    puts "Teacher of #{@name_lesson} is #{teach_FIO} number #{teach_id}"
  end

end




var1 = Student.new('25', 'Semenchenko Semen', '25.05.1995', 'Homenka 37 kv.4')
var2 = Teacher.new('History', '28.11.2016')
var3 = Lesson.new('History', '28.11.2016')
var4 = Journal.new

puts "== Lesson =="

var1.student_base('25', 'Semenchenko Semen', '25.05.1995', 'Homenka 37 kv.4')
var2.teacher_card('Guba Ivan Petrovich', '354657')
var3.lesson_base('History', '28.11.2016')
puts var2.name_lesson