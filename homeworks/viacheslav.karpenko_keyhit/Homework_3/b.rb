puts ""
puts "Автомобільна фабрика демонструє паттерн BUILDER"

class Vehicle_builder

	def gathering_engine(liters)
		puts "Взяти деталі двигуна об'ємом #{liters} літрів."
		puts "Зібрати головку блоку циліндрів."
		puts "Зібрати блок."
		puts "Встановити поршньову."
		puts "Закрити піддоном."

	end

	def gathering_car_body(type)
		puts "Взяти елементи для автомобіля #{type}."
		puts "З’єднати готові елементи точковою зваркою."
		puts "Пофарбувати."
	end

	def gathering_chassis(whel = 4, dampers = 4)
		puts "Встановити #{whel} колеса на осі."
		puts "Встановити #{dampers} амортизатори."
	end

end

puts ""
puts ""
puts "Конвеєр автомобілів седан"
puts ""

sedanCar = Vehicle_builder.new()
sedanCar.gathering_engine(1.5)
sedanCar.gathering_car_body("седан")
sedanCar.gathering_chassis

puts " *		*		*"
puts ""
puts "Конвеєр автомобілів універсал"
puts ""

universalCar = Vehicle_builder.new()
universalCar.gathering_engine(1.5)
universalCar.gathering_car_body("універсал")
universalCar.gathering_chassis

puts " *		*		*"
puts ""
puts "Конвеєр вантажних автомобілів"
puts ""

hevyCar = Vehicle_builder.new()

class << hevyCar

	def driver_cabin()
		puts "Зватити кабіну."
		puts "Встановити двері."
		puts "Встановити органи керування."
	end

	def hevy_base()
		puts "Нарізати сталеві профілі."
		puts "Зігнути сталеві профілі."
		puts "З’єднати профілі заклепками."
	end

end

hevyCar.driver_cabin
hevyCar.hevy_base
hevyCar.gathering_engine(5.0)
hevyCar.gathering_chassis(10, 6)

puts " *		*		*"
puts ""
puts "Конвеєр мотоциклів"
puts ""

motorcycle = Vehicle_builder.new()

class << 	motorcycle

	def motorcycle_base()
		puts "Нарізати сталеві труби "
		puts "Зігнути сталеві труби."
		puts "З’єднати електродуговою зваркою."
	end

end

motorcycle.gathering_engine(1)
motorcycle.motorcycle_base
motorcycle.gathering_chassis(2, 4)



