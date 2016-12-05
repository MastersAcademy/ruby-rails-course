require 'set'
starter = "Input your height and weight"
p starter
findings = Array.new(2)
height = gets.to_i
weight = gets.to_i
findings[0] = height
findings[1] = weight
patient_parameters1 = {"height" => height,"weight" => weight,"name" => "\n"}
if height > 200 or weight < 10
  p "Maybe you made a mistake. Let's see"
  p patient_parameters1.assoc("height")
  p patient_parameters1.assoc("weight")
end
findings.clear
p "Let's try again"
p starter
height = gets.to_i
weight = gets.to_i
findings[0] = height
findings[1] = weight
p "Your height is #{findings[0]}"
p "Your weight is #{findings[1]}"
patient_parameters2 = {"height" => height,"weight" => weight}
patient_parameters = patient_parameters1
p_p = Set.new(patient_parameters)
p patient_parameters1.has_value?("\n")
p p_p.inspect
p findings.fetch(2, "Also input your name")
patient_parameters2.store("name", gets.to_s)
while patient_parameters1.eql?(patient_parameters2)
  p "Please, input your name"
  patient_parameters2.store("name", gets.to_s)
end
patient_parameters1.merge!(patient_parameters2){|key, v1, v2| v2}
p patient_parameters1.has_value?("\n")
p "Your findings: #{patient_parameters1}"
p "You have a beautiful name - #{patient_parameters1.fetch("name")}"
p_p << patient_parameters2
p p_p.inspect