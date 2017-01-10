#Hometask_7_(functional_ruby)

require 'json'

RESPONSE='{"goods":{
                      "product":{"name": "Lenovo Tab 2", "price":2222},
                      "web_site":["http://rozetka.com.ua","http://allo.ua","http://foxtrot.com.ua"],
                      "reference":{"display":["Capacitive","IPS","7*"],
                      "processor":[{"name":"MediaTek","marking":"MTK8127"}
                                                ]
                                        }
                    }
          }'

response = JSON.parse(RESPONSE)

def create_classes (&name_class)
  Proc.new do |lambda|
    lambda.call(yield)
  end
end

def parse_goods(goods, &create_methods)
  goods.each do |key, value|
    cleate_class = create_classes { key.split("_").map! {|a| a.capitalize}.join}
    lambda = ->(name_class){ Struct.new(name_class,*yield(key, value))}
    cleate_class.call(lambda)
  end
end

create_methods = ->(key, value) do
  if value.is_a?(Hash)
    value.keys.collect(&:to_sym)
  else
    key.to_sym
  end
end


parse_goods(response["goods"], &create_methods)


Struct::Product.class_eval do
  def expensive?
    price >= 3000
  end
end
Struct::WebSite.class_eval do
  def online?
    web_site.join.downcase.scan(/com.ua/).any?
  end
end
Struct::Reference.class_eval do
  def processor_name
    processor_name = []
    processor.each {|proc| processor_name << proc["name"] }
    processor.each {|proc| processor_name << proc["marking"] }
    processor_name.join(" ")
  end

end
p "=================================================================="
product = Struct::Product.new(*response["goods"]["product"].values)
p product.name
p product.expensive?
p "=================================================================="
web_site = Struct::WebSite.new(response["goods"]["web_site"])
p web_site.web_site
p web_site.online?
p "=================================================================="
reference = Struct::Reference.new(*response["goods"]["reference"].values)
p reference.display
p reference.processor
p reference.processor_name
p "=================================================================="