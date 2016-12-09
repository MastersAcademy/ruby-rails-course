module FanRuby

  attr_accessor :question, :answer_question

  def self.included(base)
    base.extend(FanRuby)
  end

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

  def method_missing(method)
    puts "#{method} called"
  end
end

class Mentor

  attr_accessor :lecture, :detailed_answer, :task, :comments, :done

  include FanRuby

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

class Student

  attr_accessor :homework

  include FanRuby

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

module Coffe
  def coffee_break
    puts "drink coffee"
  end
end

class Mentor
  include Coffe
end

b = Student.new

module Sleep
  def love_sleep
    puts "sleep"
  end
end

class Student
  include Sleep
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

a.work_hard
b.make_cookies
b.share_cookies
