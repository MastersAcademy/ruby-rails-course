require 'json'

NONAME = '{"personal_computer": {
  "name": "ASUS X756UQ-TY001D",
  "price_arhive": [{"2015": "1000$"}, {"2016": "700$"}, {"2017": "555$"}],
  "configuration": {
    "processor": "Intel Core i3-6100U",
    "diagonal": 17,
    "memory": [{"video": "2048"}, {"RAM": "4096"}]
  },
  "comments": {
    "Andrey": "This computer is very fast",
    "Lena": "Not bad, but I need more memory RAM"
  }
}}'

response = JSON.parse(NONAME)

class MyClass
  def initialize(hash)
    parser(hash)  
  end
  
  def parser(hash)
    hash.each_pair do |key,value|
      
      define_singleton_method key do
        value
      end
      
      if value.is_a?(Hash)
        puts "key: #{key}"
        parser(value)
      else
        puts "key: [#{key}] ===> #{value}"
      end
    end
  end
    
end


obj1 = MyClass.new(response)
#p obj1.comments
#p obj1.name
#p obj1.price_arhive


#=======================================variant 2
puts "="*33

class MyClass2
  def self.parser_hash(response)
    response.each_pair do |k,v|
      
      self.instance_eval do
        define_singleton_method k do
          v
        end
      end
      
      if v.is_a?(Hash)
        self.parser_hash(v) {|k,v| yield k,v}
      else
        yield(k,v)
      end
    end
  end
  
  def self.method(a)
    a.call self
  end
  
  def self.method2
    yield(self) if block_given?
  end
end

MyClass2.parser_hash(response) do |k,v|
  puts "key: [#{k}] ===> #{v}"
end 

p MyClass2.Lena
p MyClass2.methods(false)

#=======================================

a = Proc.new do |a|
  p "Memory RAM for this computer - #{a.memory[1]['RAM']}"
end

b = Proc.new {|a| p "Number of comments - #{a.comments.length}"}

MyClass2.method(b)
MyClass2.method2 &a


#& , Proc , lambda, ::, call