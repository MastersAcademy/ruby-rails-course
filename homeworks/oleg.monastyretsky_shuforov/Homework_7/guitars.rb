# homework_7 using json, parser, proc, and lambda

require 'json'
RESPONSE = '{"guitar_store":{
                             "store_information":{"name": "guitarguitar", "adress":["6 Capitol Square", "Church St Epsom", "KT17 4NY"], "tel":"01372 730578"},
                             "electric_guitars":[{"Dean":"EVO", "hand":"left"},
                                                 {"Cort":"MBC1", "hand":"right"}, 
                                                 {"Gibson":"Les Paul Custom Alpine White","hand":"right"}
                                                ],
                             "electric_amps":[{"Marshall":["MG10CF 10 Watt Guitar Combo Carbon Fibre", "MS-2", "CODE100H 100 Watt Head"],
                                              "Laney":["LX10 Guitar Combo", "LX12 Combo"],
                                              "Friedman":["Pink Taco Head New Spec with 3 Position Gain Structure Switch", "Mini Dirty Shirley Head"],
                                              "Mesa Boogie":["Recto-Verb 25 1x12 1.RV25X.BK.G", "Mark V:35 1x12 Combo ", "Dual Rectifier Solo Head Classic Version"]
                                             }]
                           }
           }'

response = JSON.parse(RESPONSE)

name_of_class = lambda do |key|
  key.split('_').map!(&:capitalize).join
end

create_symb = lambda do |key, value|
  if value.is_a?(Hash)
    value.keys.collect(&:to_sym)
  else
    key.to_sym
  end
end

create_struct = proc do |element|
  element.map do |key, value|
    temp = Struct.new(name_of_class.call(key), *create_symb.call(key, value))
    if value.is_a?(Hash)
      instance_variable_set("@#{key}", temp.new(*value.values))
    else
      instance_variable_set("@#{key}", temp.new(value))
    end
  end
end

create_struct.call(response['guitar_store'])

@store_information.instance_eval do
  def name_store
    puts name
  end

  def adress_store
    puts adress
  end

  def tel_store
    puts tel
  end
end

@electric_amps.instance_eval do
  def brands
    puts self[0][0].keys
  end

  def list_of_brands_amplifiers(name_of_brand)
    puts self[0][0][name_of_brand]
  end

  def all_amplifiers
    self[0][0].each do |brand, name_amp|
      puts brand
      puts '++++++++++++'
      puts name_amp
      puts '------------'
    end
  end
end

@electric_guitars.instance_eval do
  def brands
    self[0].each { |brand_name| puts brand_name.first[0] }
  end

  def left_hand_guitar
    if self[0][0]['hand'] == 'left'
      puts self[0][0].first
    end
  end

  def right_hand_guitar
    if self[0][0]['right'] == 'right'
      puts self[0][0].first
    end
  end

  def list_of_brands_guitars(brand_name_of_guitar)
    self[0].each do |guitars|
      if guitars.key?(brand_name_of_guitar)
        puts brand_name_of_guitar
        puts '++++++++++'
        puts guitars[brand_name_of_guitar]
        puts '----------'
      end
    end
  end

  def list_of_all_guitars
    self[0].each do |guitars|
      puts guitars.first[0]
      puts '+++++++++++'
      puts guitars[guitars.first[0]]
      puts '-----------'
    end
  end
end

puts 'Store name'
@store_information.name_store
puts 'Store adress'
@store_information.adress_store
puts 'Store tel'
@store_information.tel_store
puts 'All brands'
@electric_amps.brands
puts 'List of Marshall amplifiers'
@electric_amps.list_of_brands_amplifiers('Marshall')
puts 'All amplifiers'
@electric_amps.all_amplifiers
puts 'All guitars in store'
@electric_guitars.list_of_all_guitars
puts 'Left heand guitars'
@electric_guitars.left_hand_guitar
puts 'Right heand guitars'
@electric_guitars.right_hand_guitar
puts 'All brands'
@electric_guitars.brands
puts 'List of brand guitars'
@electric_guitars.list_of_brands_guitars('Cort')
