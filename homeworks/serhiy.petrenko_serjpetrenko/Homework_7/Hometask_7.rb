require 'json'

RESPONSE = '{
  "person":{
    "personal_data":{
      "name": "Joe Satriani",
      "gender":"male",
      "age":60 },
    "social_profiles":["https://www.facebook.com/joesatriani/", "https://www.instagram.com/joesatriani/", "https://twitter.com/chickenfootjoe"],
    "additional_info":{
      "hobby":["playing guitar", "reading books", "traveling"]
    }
  }
}'

response = JSON.parse(RESPONSE)

person_object = Struct.new("Person", *response["person"].keys.collect(&:to_sym))
person = person_object.new(*response["person"].values)
puts person

class PersonalData
  attr_accessor :name, :gender, :age

  def all_methods
    name
    gender
    age
  end


  def name

    puts "User name: #{@name}"

  end

  def gender

    puts "User gender: #{@gender}"

  end

  def age

    puts "User age: #{@age}"

  end

end
data = PersonalData.new
data.name = person["personal_data"]["name"]
data.gender = person["personal_data"]["gender"]
data.age = person["personal_data"]["age"]
data.all_methods

class SocialInfo
  attr_accessor :social_profiles

  def social_profiles

    puts "Social_information: #{@social_profiles}"


  end

end

social = SocialInfo.new
social.social_profiles = person["social_profiles"]
social.social_profiles


class AdditionalInfo
  attr_accessor :hobby

  def hobby

    puts "User hobby: #{@hobby}"

  end


end
special_info = AdditionalInfo.new
special_info.hobby = person["additional_info"]["hobby"]
special_info.hobby



