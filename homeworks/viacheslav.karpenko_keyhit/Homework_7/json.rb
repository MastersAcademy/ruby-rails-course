require "json"

RESPONSE = '{"product": {"smartphone": {"company": "HTC", "model": "E-2110", "color": "metal", "os": "Android"},
                        "acsesories": {"headphones": "vacuum headphones", "charger": "charger 5V 2A", "wire": "wire - USB - mini USB" },
                        "default_software":["File manager", "Web browser", "Media player"],
                        "match_tools": {"for_shoot":["selfie stick", "tripod"],
                                        "peripheral_bluetooth":["bluetooth_keybord", "bluetooth_mouse"]
                                       }
                        }
            }'

catalog = JSON.parse(RESPONSE)

catalog["product"].each do |key, value|
  class_name = key.split("_").map!{|a| a.capitalize}.join
  if value.is_a?(Hash)
    Struct.new(class_name, *value.keys.collect(&:to_sym))
  else
    Struct.new(class_name, key.to_sym)
  end
end

Struct::Acsesories.class_eval do
  def instruction
    documents = "instruction and varranty"
  end 
end

Struct::MatchTools.class_eval do 
  def ear_bluetoot
    ear_bluetooth = "ear bluetooth phone"
  end
end

puts "< - Overwiev new smartphone - >"
puts "  *     *     *"

general_describe = Struct::Smartphone.new(*catalog["product"]["smartphone"].values)
puts "- Producted by - #{general_describe.company}"
puts "- Has model - #{general_describe.model}"
puts "- Has color - #{general_describe.color}"
puts "- OS on board - #{general_describe.os}"

puts "  *  -  *  -  *"

complectation = Struct::Acsesories.new(*catalog["product"]["acsesories"].values)
puts "Complected with: #{complectation.headphones}, #{complectation.charger}, #{complectation.wire}, #{complectation.instruction}"

puts "  *  -  *  -  *"

puts "Installed factory soft "
default_soft = Struct::DefaultSoftware.new(catalog["product"]["default_software"])
puts default_soft.default_software.each {|sw| sw }

puts "  *  -  *  -  *"

puts "Also for this device we have"
match_for_it = Struct::MatchTools.new(*catalog["product"]["match_tools"].values)
puts match_for_it.for_shoot
puts match_for_it.ear_bluetoot
puts match_for_it.peripheral_bluetooth
