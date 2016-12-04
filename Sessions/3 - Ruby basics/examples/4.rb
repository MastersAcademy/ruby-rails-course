# Ruby and RubyOnRails course examples by masterofcode.com
# Copyright (C) 2014  Masterofcode LLC

# Symbols
a = :foo
b = :foo
puts 'Symbols'
puts '==================================================================='
puts a.object_id
puts b.object_id
puts

# Strings
a = 'foo'
b = 'foo'
puts 'Strings'
puts '==================================================================='
puts a.object_id
puts b.object_id
puts

# Integers
a = 1
b = 1
puts 'Integers'
puts '==================================================================='
puts a.object_id
puts b.object_id
puts

# Not a Fixnum
a = 4_611_686_018_427_387_904
b = 4_611_686_018_427_387_904
puts 'Integers after Fixnum range'
puts '==================================================================='
puts a.object_id
puts b.object_id
puts
