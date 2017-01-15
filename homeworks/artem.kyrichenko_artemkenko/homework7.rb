require 'json'
RESPONSE='{"powerlifter":{
                      "personal_data":{"name": "Michael Json", "gender":"male", "mass":80},
                      "honor":["Mr Olympia","Medal of Honor","Nobel Prize"],
                      "additional_info":{"hobby":["Smoke weed","reading","lifting"],
                                         "base":[{"exercise":"Deadlift","weight":180},
                                                 {"exercise":"Squads","weight":140},
                                                 {"exercise":"Bench press","weight":90}
                                                ]
                                        }
                    }
          }'

response = JSON.parse(RESPONSE)

response['powerlifter'].each do |key, value|
  name_class = key.split('_').map! {|a| a.capitalize}.join
  if value.is_a?(Hash)
    Struct.new(name_class, *value.keys.collect(&:to_sym))
  else
    Struct.new(name_class, key.to_sym)
  end
end



Struct::PersonalData.class_eval do
  def drishch?
    if mass >= 100
      "powerlifter"
    else
      "do you even lift?"
    end

  end
end
Struct::Honor.class_eval do
  def honors?
    honor.join.scan(/Nobel Prize/).any?
  end
end
Struct::AdditionalInfo.class_eval do
  def amount_of_hobby
    "he has #{hobby.length} hobby"
  end

  def base_sum
    base_exercise = []
    base.each {|weight| base_exercise << weight["weight"] }
    a = base_exercise[0]+base_exercise[1]+base_exercise[2]

  end
end

hard_work = Proc.new do |struct|
  struct.to_h.each do |key, value|
   p  "he has #{value.length} honors"
  end
end

p "=================================================================="
personal_data = Struct::PersonalData.new(*response["powerlifter"]["personal_data"].values)
p personal_data.name
p personal_data.gender
p personal_data.drishch?
p "=================================================================="
honor = Struct::Honor.new(response["powerlifter"]["honor"])
p honor.honor
p honor.honors?
hard_work.call(honor)
p "=================================================================="
additional_info = Struct::AdditionalInfo.new(*response["powerlifter"]["additional_info"].values)
p additional_info.hobby
p additional_info.amount_of_hobby
p additional_info.base_sum
p "=================================================================="
