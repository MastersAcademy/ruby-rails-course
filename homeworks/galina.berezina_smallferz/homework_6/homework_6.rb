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
    puts "answer question"
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

  def do_homework(homework)
    @homework = true
    if homework != 1
      raise HomeworkError
    end
    rescue HomeworkError
    puts "do smth else"
  else
    puts "homework trial"
  end
end

class HomeworkError < StandardError
end

puts "=============================="
puts "how its plan to work"

a = Mentor.new

b = Student.new

begin
  Mentor.new.new_method
  Student.new.new_method
  rescue NoMethodError
    def method_missing(method, &block)
      eigenclass = class << self; self; end
      eigenclass.class_eval do
        define_method(method) do
          puts "#{method}"
        end
      end
      send(method, &block)
    end
  else
    puts "надо переделать rescue"
end


a.lecture

b.listen_lecture
b.ask_question

a.answer_question
a.give_homework

b.think
b.googlit
b.read
b.do_homework(homework = smth)
b.do_homework(homework = 1)

a.check_homework

a.coffee_break
a.work_hard
b.make_cookies
b.share_cookies
