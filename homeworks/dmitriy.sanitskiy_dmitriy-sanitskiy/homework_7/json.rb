require 'json'
RESPONSE='{
            "data": {
              "object_type": "article",
              "object_id": "1",
              "object_attributes": {
                "title": "Title!",
                "body": "The shortest article. Ever.",
                "created": "2015-05-22 14:56:29",
                "updated": "2015-05-22 14:56:30"
              },
              "author": {
                "type": "people",
                "id": "42",
                "name": "Will",
                "surname": "Smith",
                "age": 37,
                "gender": "male",
                "social_profiles": {
                  "FB": "http://facebook.com/id_1",
                  "Twitter":"http://twitter.com/id_1",
                  "VK":"http://vk.com/id_1",
                  "OK":"http://ok.ru/id_1"
                }
              }
            }
          }'

blog = JSON.parse(RESPONSE)

def create_classes (&name_class)
  Proc.new do |lambda|
    lambda.call(yield)
  end
end

def parse_data(data, &create_methods)
  data.each do |key, value|
    create_class = create_classes { key.split("_").map! { |a| a.capitalize }.join }
    lambda = ->(name_class) { Struct.new(name_class, *yield(key, value)) }
    create_class.call(lambda)
  end
end

create_methods = ->(key, value) do
  if value.is_a?(Hash)
    value.keys.collect(&:to_sym)
  else
    key.to_sym
  end
end

parse_data(blog["data"], &create_methods)

Struct::Author.class_eval do
  def amount_of_accounts
    social_profiles.length
  end

  def fb_account?
    social_profiles.values.join.downcase.scan(/facebook/).any?
  end

  def google_account?
    social_profiles.values.join.downcase.scan(/google/).any?
  end

  def any_accounts?
    if social_profiles.length > 0
      social_profiles.keys.join(', ')
    else
      p "I have't any social profile"
    end
  end
end

object_type = Struct::ObjectType.new(*blog["data"]["object_type"])
object_id = Struct::ObjectId.new(*blog["data"]["object_id"])
attributes = Struct::ObjectAttributes.new(*blog["data"]["object_attributes"].values)
author = Struct::Author.new(*blog["data"]["author"].values)

p "=================================================================="
p "Hello. my name is #{author.surname}, #{author.name} #{author.surname}."
p "I'm #{author.gender}, #{author.age} years old"

p "I have #{author.social_profiles.length} accounts in #{author.any_accounts?}"
print "Have fb_account? "
p author.fb_account?
print "Have google_account? "
p author.google_account?
p "my profile in FB #{author.social_profiles['FB']}"

p "#{attributes.created} I was wrote #{object_type.object_type}, what called #{attributes.title}"
p attributes.body
