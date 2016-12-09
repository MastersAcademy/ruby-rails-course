module Info
  def get_info
    puts "Basic methods of #{self} class: #{self.instance_methods(false)}"
  end
end

module Groupify
  def initialize
    @groups = Hash.new{|hash, key| hash[key] = []}
  end

  def add_to_group(group, item)
    @groups[group] << item
  end

  def print_groups
    puts "Groups: #{@groups.keys}"
  end
end

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

# Saving and removing contacts
class AddressBook
  include Groupify

  attr_reader :contacts, :groups

  def initialize
    @contacts = []
    super
  end

  def print_contact_list
    puts 'Contact List:'
    puts '-------------'
    contacts.each do |contact|
      contact.to_s
    end
  end

  def print_by_group(group)
    puts "Group - #{group}:"
    @groups[group].each{|g| g.to_s}
  end

  def add(contact)
    contacts.push(contact)
  end

  def remove(first_name, last_name)
    contacts.delete_if {|s| s.first_name.eql?(first_name) && s.last_name.eql?(last_name)}
  end
end

#Backup and restore messages
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
  extend Info

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

auror = Contact.new('Percival','Graves')
auror.add_phone_number('+32(121)-333-7222')

address_book = AddressBook.new
draft = MsgVersion.new

address_book.add(thomas)
address_book.add(clara)
address_book.add(queenie)
address_book.add(auror)

address_book.add_to_group('Friends',clara)
address_book.add_to_group('Friends',auror)
address_book.add_to_group('Work',queenie)
address_book.print_by_group('Friends')
address_book.print_by_group('Work')
address_book.print_groups

puts "\n======= Check Memento ============="
msg = Message.new('Clara', 'Good morning!')
msg.print_msg

draft.add(msg.save)
msg.body = 'Good evening!'
msg.restore(draft.version(0))
msg.print_msg

Message.get_info