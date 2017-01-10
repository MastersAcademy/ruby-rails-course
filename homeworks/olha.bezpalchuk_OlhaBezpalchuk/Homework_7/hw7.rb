require 'json'

RESPONSE = '{
  "character": {

    "main_data": {
      "name": "Super Hero",
      "gender": "male",
      "level": 80,
      "gold": 210000,
      "karma": 210000
    },

    "stats": {
      "health": 100,
      "stamina": 100,
      "supermana": 100,
      "exp_points": 10
    },

    "equipment": {
      "head": "SuperMask",
      "body": "Super Body Armor",
      "legs": "SuperShirts",
      "hands": "SuperGroves",
      "wrists": "SuperBracers",
      "waist": "SuperBelt",
      "feet": "SuperBoots",
      "neck": "",
      "weapon": ""
    },


    "backpack": {
       "junk": ["Broken Stick", "True Junk"],
       "not_junk": [
          {
            "title": "Not Junk",
            "type": "Mission Item",
            "price": "100"
          },
          {
            "title": "SuperHelm",
            "type": "Armor",
            "price": "1000"
          }
       ]
    },

    "abilities": {
      "main_abilities": {
        "power": 1000,
        "defence": 1000
      },
      "super_abilities": [
        "flying",
        "speed running",
        "fireball"
      ]
    }
  }
}'

response = JSON.parse(RESPONSE)

response['character'].each do |key, value|
  name_class = key.split('_').map! {|a| a.capitalize}.join
  if value.is_a?(Hash)
    Struct.new(name_class, *value.keys.collect(&:to_sym))
  else
    Struct.new(name_class, key.to_sym)
  end
end

Struct::MainData.class_eval do
  def new_player?
    level == 0
  end
end

Struct::Stats.class_eval do
  def full_experience?
    exp_points == 100
  end
end

Struct::Equipment.class_eval do
  def empty_slots
    empty = []
    self.to_h.each {|key, value| empty << key if value.empty?}
    empty
  end
end

Struct::Backpack.class_eval do
  def junk_for_sale
    puts junk.join "\n"
  end
end

Struct::Abilities.class_eval do
  def show_super_abilities
    puts super_abilities.join "\n"
  end
end

cute_print = Proc.new do |struct|
  struct.to_h.each do |key, value|
    puts "#{key}: #{value}"
  end
end

################################
# testing
#
puts 'Character:'
main_data = Struct::MainData.new(*response['character']['main_data'].values)
cute_print.call(main_data)
puts main_data.new_player? ? 'New player! How kind!' : 'Experienced player! Wow!'
puts '----------------------------------------'
puts 'Stats:'
stats = Struct::Stats.new(*response['character']['stats'].values)
cute_print.call(stats)
puts stats.full_experience? ? 'Time to level up!' : 'New level will become later'
puts '----------------------------------------'
puts 'Equipment:'
equipment = Struct::Equipment.new(*response['character']['equipment'].values)
cute_print.call(equipment)
puts 'Empty slots:'
equipment.empty_slots
puts equipment.empty_slots.to_s
puts '----------------------------------------'
backpack = Struct::Backpack.new(*response['character']['backpack'].values)
puts 'Junk for sale:'
backpack.junk_for_sale
puts '----------------------------------------'
abilities = Struct::Abilities.new(*response['character']['abilities'].values)
puts 'Super Abilities'
abilities.show_super_abilities
