#Description predmetnoy region: SESSION
class Session
  attr_accessor :еxam_scores, :after_scores, :bal

  def initialize(value, int)
    puts 'you come to the exam'
    self.еxam_scores = value
    puts "You had #{еxam_scores} points for exam"
    self.after_scores = int
    puts "Lecturer at the exam you put #{after_scores} points"
  end

  def bals
    self.bal = еxam_scores + after_scores
    puts "you got #{bal} points"
  end

  def mark
    puts 'and you got mark -'
    case @bal
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

session = Session.new(25, 55)
session.bals
session.mark
puts
