module Groupable
  def groups
    @groups ||= []
  end

  def add_to_group(group)
    groups << group
  end

  def remove_from_group(group)
    groups.delete(group)
  end

  def print_groups
    puts "Groups: #{groups}"
  end
end

class MessageSizeError < StandardError
  def initialize(msg = 'Error! Size of the message is out of range')
    super(msg)
  end
end

class Contact
  include Groupable

  attr_reader :first_name, :last_name
  attr_reader :phone_numbers

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @phone_numbers = []
  end

  def add_phone_number(number)
    phone_numbers.push(number)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    puts full_name
    print_phone_numbers
  end

  def print_phone_numbers
    puts 'Phone numbers:'
    phone_numbers.each { |phone_number| puts phone_number }
    puts "\n"
  end
end

class Message
  include Groupable

  MAX_MSG_SIZE = 20
  attr_accessor :body

  def initialize(body)
    if body.size > MAX_MSG_SIZE
      raise MessageSizeError
    else
      @body = body
    end
  end

  def self.print_text
    puts 'Message: Hello there'
  end

  def print_text
    puts "Message: #{body}"
  end
end

class Phone

  def send_message(name, message)
    begin
      message.send_to(name)
    rescue NoMethodError => e
      puts "Method '#{e.name}' not exist, but will be created!"

      def message.metaclass
        class << self; self; end
      end

      message.metaclass.send(:define_method, e.name) do |arg|
        print_text
        puts "was sent to [#{arg}]"
        puts
      end
    end
  end
end

phone = Phone.new

clara = Contact.new('Percival','Graves')
clara.add_phone_number('+37(021)-413-1921')
clara.add_phone_number('+37(012)-932-8643')
clara.add_to_group('Work');
clara.add_to_group('Friends');

message = Message.new('Happy Holidays!')

#test calling undefined method for object
phone.send_message(clara.full_name, message)
message.send_to('Percival Graves')

#test calling undefined method for class
phone.send_message(clara.full_name, Message)
Message.send_to('CLARA OSWALD')

#test own exception
begin
  big_message = Message.new('May the magic and the thrill of the holiday season stretch on')
rescue MessageSizeError => e
  puts e.message
end
