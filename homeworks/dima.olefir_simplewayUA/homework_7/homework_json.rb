require 'json'
RESPONSE='{"person":{
                      "personal_data":{"name": "Dima Olefir", "gender":"male", "age":23}, 
                      "social_profiles":["http://facebook.com/opchirik", "http://vk.com/opchirik","https://twitter.com/opchirik"],
                      "additional_info":{"hobby":["football","sport"],
                                          "language":[{"lang":"English"},
                                                      {"lang":"French"}]
                                        }
                    }
          }'

bio = JSON.parse(RESPONSE)

bio['person'].each do |key, value|
  name_class = key.split('_').map! {|a| a.capitalize}.join
  if value.is_a?(Hash)
    Struct.new(name_class, *value.keys.collect(&:to_sym))
  else
    Struct.new(name_class, key.to_sym)
  end
end

print = Proc.new do |struct|
  struct.to_h.each do |key, value|
    puts "#{key}: #{value}"
  end
end

Struct::PersonalData.class_eval do
  def adult?
    age >= 18 
  end
end

Struct::SocialProfiles.class_eval do
  def google_account?
    social_profiles.join.downcase.scan(/google/).any?
  end
end

Struct::AdditionalInfo.class_eval do
  def amount_of_languages
    language.length
  end

  def languages
    languages = []
    language.each { |lang| languages << lang["lang"] }
    languages.join(", ")
  end
end

puts "=================================================================="
personal_data = Struct::PersonalData.new(*bio["person"]["personal_data"].values)
print.call(personal_data)
p personal_data.adult?
puts "=================================================================="
social_profiles = Struct::SocialProfiles.new(bio["person"]["social_profiles"])
p social_profiles.social_profiles
p social_profiles.google_account?
puts "=================================================================="
additional_info = Struct::AdditionalInfo.new(*bio["person"]["additional_info"].values)
puts "My hobby:"
p additional_info.hobby
puts "I learn #{additional_info.amount_of_languages} languages:"
p additional_info.languages
p "=================================================================="