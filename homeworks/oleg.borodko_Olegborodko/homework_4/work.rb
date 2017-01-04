require "set"

class Dinamic < Array
  class << self #method for class
    def to_sym_check(m)
      begin
        m.to_sym
      rescue Exception => msg
        puts "#{msg}"
        puts "can't convert to symbol"
      ensure
      end
    end
  end

  def el_plus_el(m)
    m + m
  end
end

obj1 = Dinamic[1, true, :simbol, [0, 1], {a: 2}, 1]

puts obj1.el_plus_el obj1.el_plus_el 1 #4
puts Dinamic.to_sym_check "test"
puts obj1.include? [0, 1] #true

puts obj1.map! { |a| a.to_s*2 }.inspect
obj1.delete("11")
puts obj1.inspect

#puts obj1.each_with_object([]) {|i, a| a << i*2 }
#puts Dinamic.instance_methods

#=====================================
puts "=" * 33

another_class = class Hash #methods added to class Hash
  a1 = {a: 1, b: 2, "c" => 3, "[1, 2]" => :_, :_ => 3.3}
  B1 = a1

  def test_variable
    B1
    #B1 = {c: 3} error
    #a1 error
  end

  self
end

obj2 = another_class.new
obj3 = Hash.new

puts obj2.methods.include?(:test_variable) #true
puts obj3.methods.include?(:test_variable) #true

obj3 = obj3.test_variable
obj3.default = 0 #default value

obj3[:b] = 22
puts obj3[:c] #0
obj3.store(:d, 44) 

obj3.each {|key, value| puts "#{key} is #{value}" }

puts obj3.flatten.inspect

puts obj3.has_value?(44)
puts obj3.has_key?(:d)

puts obj3.invert.inspect

puts obj3.to_set.inspect
#another_class.test_class_eval

#=====================================
puts "=" * 33

obj4 = Set[1, 2, 3, 4, true, :sym]
obj5 = Set[4, 5, 6, 7, false, :sym]

puts (obj4 + obj5).inspect 
puts (obj4 - obj5).inspect #:sym deleted
puts (obj5 - obj4).inspect #:sym also deleted

Set.class_eval do #for objects
  def test_class_eval
    puts 'Hello'
  end
end

Set.instance_eval do #for class
  def test_instance_eval
    puts 'Goodbye'
  end
end

obj6 = Set.new
obj6.test_class_eval
#obj6.test_instance_eval error
Set.test_instance_eval