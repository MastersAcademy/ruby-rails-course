class FanRuby

  attr_accessor :question, :answer_question

  def think
    puts "connect to mind"
  end

  def googlit
    puts "open google in browser and put key words"
  end

  def read
    puts "read"
  end

  def ask_question
    puts "question"
  end

  def answer_question
    puts "answer_question"
  end
end

class Mentor < FanRuby

  attr_accessor :lecture, :detailed_answer, :task, :comments, :done

  def lecture
    puts "lecture"
  end

  def depth_explanation
    puts "detailed_answer"
  end

  def give_homework
    puts "task"
  end

  def check_homework
    if @homework
      puts 'Done'
    else
      puts 'Comments'
    end
  end

end

class Student < FanRuby

  attr_accessor :homework

  def listen_lecture
    puts "listen"
  end

  def do_homework
    @homework = true
  end

end

puts "=============================="
puts "how its plan to work"

a = Mentor.new

a.instance_eval do
  def coffee_break
    puts "drink coffee"
  end
end

b = Student.new

class << Student
  def love_sleep
    puts "sleep"
  end
end

a.lecture

b.listen_lecture
b.ask_question

a.answer_question
a.give_homework

b.think
b.googlit
b.read
b.do_homework

a.check_homework
a.coffee_break
