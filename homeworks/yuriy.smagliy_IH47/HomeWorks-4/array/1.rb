arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |e| puts e }
puts '_______________________________________________________'

puts arr.select { |e| e > 5 }.inspect
puts '_______________________________________________________'

odd_arr = arr.select { |e| e.odd? }
puts odd_arr.inspect
even_arr = arr.select { |e| e.even? }
puts even_arr.inspect
puts '_______________________________________________________'

arr.unshift(11)
arr.push(3)
puts arr.inspect
puts '_______________________________________________________'
