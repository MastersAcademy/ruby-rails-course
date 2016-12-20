
module Fio
  attr_accessor :name, :surname

  def name(name, surname)
    @name = name 
    @surname = surname
    puts "Name: #{name}"
    puts "Surname: #{surname}"
  end
end

module Sub
  attr_accessor :name_sub

  def name_sub(name_sub)
    @name_sub = name_sub
    puts "Subject_name: #{name_sub}"
  end
end

class NoLicenceException < StandardError
  attr_accessor :message

  def initialize(message)
    @message = message
    puts message
  end
end


class Student
  attr_accessor :group, :course
   
  include Fio

  def group(group)
    @group = group
    puts "Group: #{group}"
  end

  def course(course)
    @course = course
    puts "Course: #{course}"
  end
end

class Teacher
  include Fio
  include Sub
end

class Subject
  attr_accessor :еxam_scores, :after_scores, :bals
  
  include Sub

  def bal(еxam_scores, after_scores)
    @еxam_scores = еxam_scores
    puts "You had #{еxam_scores} points for exam"
    @after_scores = after_scores
    puts "Lecturer at the exam you put #{after_scores} points"
    @bals = еxam_scores + after_scores
    puts "You got #{bals} points"
  end

  def mark
    puts 'And you got mark -'
    case @bals
    when 90..100 then puts('A')
    when 82..89 then puts('B')
    when 75..81 then puts('C')
    when 67..74 then puts('D')
    when 60..66 then puts('E')
    when 35..59 then puts('FХ')
    else puts('F')
    end
  end
end

puts "*******************************"
puts "Student's personal information"
student = Student.new
student.name('Vasiliy', 'Protsenko')

begin
  student.age
rescue NoMethodError => e
  puts "No method #{e.name}."
  define_method :rename do
  puts "I did not tell my age"
  end
ensure
  student.rename
end

student.group('PM')
student.course(5)
puts "*******************************"

teacher = Teacher.new
puts "Teacher personal information"
teacher.name("Vladyslav", "Prudenko")
teacher.name_sub("Мathematic")
puts "*******************************"

puts "information for subject"
subject = Subject.new
subject.name_sub("Mathematic")
subject.bal(45, 53)
subject.mark
puts "*******************************"
