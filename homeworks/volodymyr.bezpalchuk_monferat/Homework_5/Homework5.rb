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

  attr_accessor :acceptor, :body

  def initialize(acceptor, body)
    @acceptor = acceptor
    @body = body
  end

  def print_text
    print "to [#{acceptor}]: "
    puts body
  end
end

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts 'Contact List:'
    contacts.each do |contact|
      contact.to_s
    end
  end

  def add(contact)
    contacts.push(contact)
  end

  def remove(contact)
    contacts.delete(contact)
  end
end

auror = Contact.new('Percival','Graves')
auror.add_phone_number('+38(050)-873-9832')
auror.add_phone_number('+38(063)-231-8741')
auror.add_to_group('Work');

clara = Contact.new('Clara','Oswald')
clara.add_phone_number('+37(021)-413-1921')
clara.add_phone_number('+37(012)-932-8643')
clara.add_to_group('Work');
clara.add_to_group('Friends');

queenie = Contact.new('Queenie','Goldstein')
queenie.add_phone_number('+35(103)-113-7863')
queenie.add_to_group('Friends');

queenie.print_groups
clara.print_groups

msg = Message.new(clara.first_name, 'Happy holidays')
msg_draft = Message.new(clara.first_name, 'I will come soon')

msg.add_to_group('Templates');
msg.add_to_group('Drafts');
msg_draft.add_to_group('Drafts');

msg.print_groups
msg_draft.print_groups
msg.remove_from_group('Drafts')
msg.print_groups
msg.print_text
puts

address_book = AddressBook.new

address_book.add(clara)
address_book.add(queenie)
address_book.add(auror)
address_book.print_contact_list