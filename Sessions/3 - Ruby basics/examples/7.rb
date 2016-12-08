# Ruby and RubyOnRails course examples by masterofcode.com
# Copyright (C) 2014  Masterofcode LLC

sally = Object.new
dolly = Object.new
puts sally.public_methods.count
puts dolly.public_methods.count
puts '======================================================================='

class << sally
  def moo
    puts 'I can moo now thanks to my eigenclass!'
  end
end

puts 'Object changes through the eigenclass(meta-class)'
puts '======================================================================='
sally.moo
puts sally.class
puts sally.public_methods.count
puts dolly.public_methods.count
puts dolly.class == sally.class
