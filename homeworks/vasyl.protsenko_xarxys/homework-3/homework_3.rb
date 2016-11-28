#Description predmetnoy region: SESSION
class Student
  attr_accessor :name_s, :surname_s, :group, :course  
  
  def name(name_s, surname_s)
    puts "Student's personal information"
    @name_s = name_s

    puts "Name: #{name_s}"
    @surname_s = surname_s
    puts "Surname: #{surname_s}"
  end

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
  attr_accessor :name_t, :surname_t, :subject_teaching

  def name(name_t, surname_t)
    puts "Teacher personal information"
    @name_t = name_t
    puts "Name: #{name_t}"
    @surname_t = surname_t
    puts "Surname: #{surname_t}"
  end

  def subject(subject_teaching)
    @subject_teaching = subject_teaching
    puts "Subject_teaching: #{subject_teaching}"
  end
end

class Subject
  attr_accessor :name_sub, :еxam_scores, :after_scores, :bals

  def name(name_sub)
      @name_sub = name_sub
      puts "Name of the subject: #{name_sub}"
  end

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
student = Student.new
student.name('Vasiliy', 'Protsenko')
student.group('PM')
student.course(5)
puts "*******************************"

teacher = Teacher.new
teacher.name("Vladyslav", "Prudenko")
teacher.subject("Мathematic")
puts "*******************************"

subject = Subject.new
subject.name("Mathematic")
subject.bal(45, 53)
subject.mark
puts "*******************************"
