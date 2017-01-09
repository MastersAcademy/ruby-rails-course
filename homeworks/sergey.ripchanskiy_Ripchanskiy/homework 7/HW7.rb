require 'json'
RESPONSE='{"person":{
                      "personal_data":{"name": "Sergey Ripchanskiy", "gender":"male", "age":26},
                      "social_profiles":["http://facebook.com/ripchanskiy","http://vk.com/id1553456"],
                      "additional_info":{"hobby":["swimming","drinking"],
                                         "pets":[{"name":"Don","species":"dog"},
                                                 {"name":"Oskar","species":"fish"},
                                                 {"name":"Monya","species":"dog"}
                                                ]
                                        }
                    }
          }'

response = JSON.parse(RESPONSE)

response['person'].each do |key, value|
  name_class = key.split('_').map! {|a| a.capitalize}.join
  if value.is_a?(Hash)
    Struct.new(name_class, *value.keys.collect(&:to_sym))
  else
    Struct.new(name_class, key.to_sym)
  end
end

Struct::PersonalData.class_eval do
  def adult?
    age >= 18 
  end
end

Struct::SocialProfiles.class_eval do
  def twitter_account?
    social_profiles.join.downcase.scan(/instagram/).any?
  end
end

Struct::AdditionalInfo.class_eval do
  def amount_of_pets
    pets.length
  end

  def pets_name
    pets_name = []
    pets.each {|pet| pets_name << pet["name"] }
    pets_name.join(", ")
  end
end

key_value_print = Proc.new do |struct|
  struct.to_h.each do |key, value|
    puts "#{key}: #{value}"
  end
end

p "=================================================================="
personal_data = Struct::PersonalData.new(*response["person"]["personal_data"].values)
key_value_print.call(personal_data)
p personal_data.adult?
p "=================================================================="
social_profiles = Struct::SocialProfiles.new(response["person"]["social_profiles"])
p social_profiles.social_profiles
p social_profiles.twitter_account?
p "=================================================================="
additional_info = Struct::AdditionalInfo.new(*response["person"]["additional_info"].values)
p "My hobby:"
p additional_info.hobby
p "I have #{additional_info.amount_of_pets} pets:"
p additional_info.pets_name
p "=================================================================="