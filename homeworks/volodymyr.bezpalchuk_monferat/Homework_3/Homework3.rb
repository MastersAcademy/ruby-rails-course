class Contact
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
    first_name + ' ' + last_name
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

# Saving and removing contacts (Registry pattern)
class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts 'Contact List:'
    puts '-------------'
    contacts.each do |contact|
      contact.to_s
    end
  end

  def add(contact)
    contacts.push(contact)
  end

  def remove(first_name, last_name)
    contacts.delete_if {|s| s.first_name.eql?(first_name) && s.last_name.eql?(last_name)}
  end
end

#Backup and restore messages(Memento pattern)
class Memento
  attr_reader :acceptor, :body

  def initialize(message)
    @acceptor = message.acceptor
    @body = message.body
  end
end

class MsgVersion
  attr_reader :versions

  def initialize
    @versions = {}
    @version_number = 0
  end

  def add(version)
    @versions[@version_number] = version
    @version_number += 1
  end

  def version(number)
    @versions[number]
  end
end

class Message
  attr_accessor :acceptor, :body

  def initialize(acceptor, body)
    @acceptor = acceptor
    @body = body
  end

  def print_msg
    print "to [#{acceptor}]: "
    puts body
  end

  def save
    Memento.new(self)
  end

  def restore(version)
    @acceptor = version.acceptor
    @body = version.body
  end
end

thomas = Contact.new('Thomas','Berger')
thomas.add_phone_number('+38(050)-873-9832')
thomas.add_phone_number('+38(063)-231-8741')

clara = Contact.new('Clara','Oswald')
clara.add_phone_number('+37(021)-413-1921')
clara.add_phone_number('+37(012)-932-8643')

queenie = Contact.new('Queenie','Goldstein')
queenie.add_phone_number('+35(103)-113-7863')

tom = Contact.new('Percival','Graves')
tom.add_phone_number('+32(121)-333-7222')

address_book = AddressBook.new
draft = MsgVersion.new

address_book.add(thomas)
address_book.add(clara)
address_book.add(queenie)

address_book.add(tom)

address_book.print_contact_list
address_book.remove('Thomas','Berger')
puts '=============================='
address_book.print_contact_list

puts '======= Check Memento ============='
msg = Message.new('Clara', 'Good morning!')
msg.print_msg

draft.add(msg.save)
msg.body = 'Good evening!'
msg.restore(draft.version(0))
msg.print_msg