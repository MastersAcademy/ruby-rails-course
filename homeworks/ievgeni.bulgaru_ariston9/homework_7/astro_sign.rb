require 'json'
require 'date'

file = File.read('sign.json')
signs = JSON.parse(file)


puts "When did you born(select dates in the format dd:mm)"
input_user = STDIN.gets.chomp
user_birth_date = Date.parse(input_user + '.2016')

user_sign = nil

signs.each do |key, value|

  dates = value['dates_user'].split('..')

  if (Date.parse(dates[0] + '.2016') <= user_birth_date) &&
      (user_birth_date <= Date.parse(dates[1] + '.2016'))

    user_sign = value
  end
end

signs.each do |key, value|
  name_class = key.split("_").map! { |a| a.capitalize }.join
  if value.is_a?(Hash)
    Struct.new(name_class, *value.keys.collect(&:to_sym))
  else
    Struct.new(name_class, key.to_sym)
  end
end

create_proc = Proc.new do |sign|
  sign.each { |key, value| puts "#{key}: #{value}" }
end

Struct::Aries.class_eval do
  def astro_text
    text_user.empty?
  end
end


p '=====================RESULT======================='
p '*******Result input user********'
puts user_sign['dates_user']
puts user_sign['text_user']
puts '--------------------------------------------------'
p "Horoskope for the'Taurus'"
taurus_sign = Struct::Taurus.new(*signs["taurus"].values)
create_proc.call(taurus_sign)
puts '--------------------------------------------------'
aries_sign = Struct::Aries.new(*signs["aries"].values)
p "Horoskope for the'Aries'"
p aries_sign.dates_user
p aries_sign.text_user
p aries_sign.astro_text