arr = []
month_hash = Hash.new { |h, k| h[k] = [] }

40.times do
  day = rand(1..31)
  month = rand(1..12)
  temp = rand(-50..50)
  arr << "#{day}.#{month} #{temp}"
end

arr.each do |e|
  date, temp = e.split(' ')
  month = date.split('.')[1]
  month_hash[month.to_i] << temp.to_i
end

month_hash.sort.each do |month, arr|
  temp = arr.inject(0.0) { |sum, e| sum + e } / arr.size
  puts "Month: #{month}, temperature: #{temp}"
end
