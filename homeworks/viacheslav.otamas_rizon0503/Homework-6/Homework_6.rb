class CreditProgram
  attr_accessor :credit_currency, :credit_period, :credit_rate, :secured_loan,
                :in_cash, :foreign_currency, :credit_program_name

  def initialize(secured_loan = false, in_cash = false, foreign_currency = false)
    @secured_loan = secured_loan
    @in_cash = in_cash
    @foreign_currency = foreign_currency
    credit_core
  end

  def credit_core(credit_currency = 0, credit_period = 0, credit_rate = 0, 
                 credit_program_name = "Def")

    @credit_currency = credit_currency
    @credit_period = credit_period
    @credit_rate = credit_rate
    @credit_program_name = credit_program_name
  end  
end

class BuilderCreditProgram
  attr_reader :credit_program

  def initialize(secured_loan, in_cash, foreign_currency)

    @credit_program = CreditProgram.new

    @credit_program.secured_loan = secured_loan
    @credit_program.in_cash = in_cash
    @credit_program.foreign_currency = foreign_currency
  end

  def build_credit_core(credit_currency, credit_period, credit_rate, credit_program_name)
    @credit_program.credit_core credit_currency, credit_period, credit_rate, credit_program_name
  end

  def get_credit_program
    print "Credit program: credit currency - #{@credit_program.credit_currency}, " \
          "credit rate - #{@credit_program.credit_rate}, secured loan - #{@credit_program.secured_loan}, " \
          "in cash - #{@credit_program.in_cash}, foreign currency - #{@credit_program.foreign_currency}, " \
          "credit program name - #{@credit_program.credit_program_name}"
  end
end

class StartBuild
  def set_builder_credit_program(bcr)
    @builder_credit_program = bcr
  end

  def get_credit_program
    @builder_credit_program.get_credit_program
  end

  def get_greeting
    begin
      @builder_credit_program.greeting
    rescue NoMethodError => e
      puts e.message
      puts e.backtrace

      BuilderCreditProgram.class_eval do
        def greeting
          puts 'You have chosen the best credit line! ;-)'
          puts
        end
      end

      retry
    end
  end
end

class MyError < StandardError
  def initialize(msg = "MyError")
    super
  end
end

start_build = StartBuild.new

builder_credit_program_home = BuilderCreditProgram.new(true, false, true)
builder_credit_program_home.build_credit_core(400_000, 48, 0.36, "HOME")
start_build.set_builder_credit_program builder_credit_program_home
puts start_build.get_credit_program
start_build.get_greeting

builder_credit_program_car = BuilderCreditProgram.new(false, false, false)
builder_credit_program_car.build_credit_core(250_000, 36, 0.35, "CAR")
start_build.set_builder_credit_program builder_credit_program_car
puts start_build.get_credit_program
start_build.get_greeting

rating = 57

begin
  if rating == 100
    puts "Good rating"
  else
    raise MyError, "Bad rating"
  end
rescue MyError => error
  error.message
  puts "Got rating - #{error}. Work on!..."
end
