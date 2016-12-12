class CreditProgram
  attr_accessor :credit_currency,
                :credit_period,
                :credit_rate,
                :secured_loan,
                :in_cash,
                :foreign_currency

  def initialize(credit_currency = 0,
                 credit_period = 0,
                 credit_rate = 0,
                 secured_loan = false,
                 in_cash = false,
                 foreign_currency = false)
    credit_currency, credit_period, credit_rate, secured_loan,
    in_cash, foreign_currency =
    credit_currency, credit_period, credit_rate, secured_loan,
    in_cash, foreign_currency
  end
end

module BuilderCreditProgram
  attr_reader :credit_program

  def build_new_credit_program
    @credit_program = CreditProgram.new
  end

  def get_credit_program
    puts "Credit program: credit currency - #{@credit_program.credit_currency}, " \
    "credit rate - #{@credit_program.credit_rate}, secured loan - #{@credit_program.secured_loan}, " \
    "in cash - #{@credit_program.in_cash}, foreign currency - #{@credit_program.foreign_currency}."
  end
end

class BuilderCreditProgramHome
  include BuilderCreditProgram

  def build_credit_currency
    @credit_program.credit_currency = 250_000
  end

  def build_credit_period
    @credit_program.credit_period = 36
  end

  def build_credit_rate
    @credit_program.credit_rate = 0.35
  end

  def build_secured_loan
    @credit_program.secured_loan = true
  end

  def build_in_cash
    @credit_program.in_cash = false
  end

  def build_foreign_currency
    @credit_program.foreign_currency = true
  end
end


class BuilderCreditProgramCar
  include BuilderCreditProgram

  def build_credit_currency
    @credit_program.credit_currency = 400_000
  end

  def build_credit_period
    @credit_program.credit_period = 48
  end

  def build_credit_rate
    @credit_program.credit_rate = 0.36
  end

  def build_secured_loan
    @credit_program.secured_loan = false
  end

  def build_in_cash
    @credit_program.in_cash = false
  end

  def build_foreign_currency
    @credit_program.foreign_currency = false
  end
end

class StartBuild
  def set_builder_credit_program(bcr)
    @builder_credit_program = bcr
  end

  def get_credit_program
    @builder_credit_program.get_credit_program
  end

  def construct_credit_program
    @builder_credit_program.build_new_credit_program
    @builder_credit_program.build_credit_currency
    @builder_credit_program.build_credit_period
    @builder_credit_program.build_credit_rate
    @builder_credit_program.build_secured_loan
    @builder_credit_program.build_in_cash
    @builder_credit_program.build_foreign_currency
  end
end

start_build = StartBuild.new

builder_credit_program_home = BuilderCreditProgramHome.new
start_build.set_builder_credit_program builder_credit_program_home
start_build.construct_credit_program
puts start_build.get_credit_program

builder_credit_program_car = BuilderCreditProgramCar.new
start_build.set_builder_credit_program builder_credit_program_car
start_build.construct_credit_program
puts start_build.get_credit_program
