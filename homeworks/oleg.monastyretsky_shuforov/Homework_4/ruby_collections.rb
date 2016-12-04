# coding: utf-8
# Homework 4 work with collections

require 'set'
# Strings that are now on the guitar (Inch dimension)
# Six string guitar
@machine_heads_guitar = [10, 13, 17, 26, 36, 46]
electric_guitar = {
  'Extra Super Light' => [8, 10, 15, 21, 30, 38],
  'Extra Super Light Plus' => [8.5, 10.5, 15, 22, 32, 39],
  'Super Light' => [9, 11, 16, 24, 32, 42, 54],
  'Super Light Plus' => [9.5, 11.5, 16, 24, 34, 44],
  'Super Light / Regular' => [9, 11, 16, 26, 36, 46],
  'Regular Light' => [10, 13, 17, 26, 36, 46, 56],
  'Regular Light Plus' => [10.5, 13.5, 18, 28, 38, 48],
  'Medium' => [11, 14, 18, 28, 38, 49, 64],
  'Light Top / Heavy Bottom' => [10, 13, 17, 30, 42, 52],
  'Medium / Heavy' => [11, 14, 18, 30, 42, 52],
  'Heavy' => [12, 16, 20, 32, 42, 54],
  'Extra Heavy' => [13, 17, 26, 36, 46, 56]
}

acustic_guitar = {
  'Extra light' => [10, 14, 23, 30, 39, 47],
  'Custom light' => [11, 15, 23, 32, 42, 52],
  'Light' => [12, 16, 25, 32, 42, 54],
  'Light/Medium' => [12.5, 16.5, 25.5, 33.5, 43.5, 56],
  'Medium' => [13, 17, 26, 35, 45, 56],
  'Heavy' => [14, 18, 27, 39, 49, 59]
}

bass_guitar = {
  'Super Light' => [40, 60, 75, 95, 12.5],
  'Custom Light' => [40, 60, 80, 100],
  'Regular Light' => [32, 45, 65, 80, 100, 130],
  'Regular Medium' => [32, 45, 65, 85, 105, 135],
  'Medium' => [50, 70, 85, 105, 135],
  'Heavy' => [55, 75, 90, 110]
}

@guitar_strings = [electric_guitar, acustic_guitar, bass_guitar]
puts 'All available strings'
puts '==='
@guitar_strings.each { |guitar_type| puts guitar_type.keys, '' }
@six_string = @guitar_strings.slice(0).each_value.each_with_object(Set.new []) do |value, set|
  if value.length == 6
    set << @guitar_strings.slice(0).key(value)
  end
end
@seven_string = @guitar_strings.slice(0).each_value.each_with_object(Set.new []) do |value, set|
  if value.length == 7
    set << @guitar_strings.slice(0).key(value)
  end
end
puts '==='
begin
  @machine_heads_guitar.fetch(6)
  puts 'Choose strings for seven string guitar'
  @seven_string.each { |string| puts string }
  @new_strings = @guitar_strings.slice(0)[@seven_string.first]
  puts '==='
rescue IndexError
  puts 'Choose strings for six string guitar'
  puts '==='
  @six_string.each { |string| puts string }
  @new_strings = @guitar_strings.slice(0)[@six_string.first]
  puts '==='
end

puts 'String at the moment on gitar'
puts @machine_heads_guitar
@machine_heads_guitar.map! do |string|
  @new_strings.slice(@machine_heads_guitar.index(string))
end
puts 'Old strings were replaced with new ones'
puts @machine_heads_guitar
