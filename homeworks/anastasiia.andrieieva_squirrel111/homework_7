require 'json'
RESPONSE = '{"person":{
                      "personal_informations":{"name": "Squirrel", "gender":"female"},
                      "personal_things":["backpack","passport","money", "tickets"],
                      "travels_info":[{"country":"Chile","city":"Atacama"},
                                      {"country":"Peru","city":"Lima"},
                                      {"country":"USA","city":"San_Francisco"},
                                      {"country":"Portugal", "city": "Lisbon"},
                                      {"country":"Malta", "city": "Valletta"}
                                     ]
                      }
          }'

response = JSON.parse(RESPONSE)
def create_classes
    proc do |lambda|
        lambda.call(yield)
    end
end

def parse_person(person)
    person.each do |key, value|
        create_class = create_classes { key.split('_').map!(&:capitalize).join }
        lambda = ->(name_class) { Struct.new(name_class, *yield(key, value)) }
        create_class.call(lambda)
    end
end

create_methods = lambda do |key, value|
    if value.is_a?(Hash)
        value.keys.collect(&:to_sym)
    else
        key.to_sym
    end
end

parse_person(response['person'], &create_methods)

Struct::PersonalInformations.class_eval do
end

p '=================================================================='
personal_informations = Struct::PersonalInformations.new(*response['person']['personal_informations'].values)
p personal_informations.name
p personal_informations.gender
p personal_informations.each_pair { |name, value| puts("#{name} => #{value}") }
p '=================================================================='

Struct::PersonalThings.class_eval do
    def tickets?
        personal_things.join.downcase.scan(/tickets/).any?
    end
end

p '=================================================================='
personal_things = Struct::PersonalThings.new(response['person']['personal_things'])
p personal_things.tickets?
p personal_things.personal_things
p '=================================================================='

Struct::TravelsInfo.class_eval do
end

p '=================================================================='
travels_info = Struct::TravelsInfo.new(*response['person']['travels_info'].values_at)
p response['person']['travels_info']
p '=================================================================='
