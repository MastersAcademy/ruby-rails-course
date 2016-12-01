def fibonacci(n)
    a = 0
    b = 1

    n.times do
    	temp = a
    	a = b
    	b = temp + b
    end

    a
end

h = {}
('a'..'z').each.with_index(1) { |e, i| h[e] = fibonacci(i) }
puts h.select { |k, v| v < 15 }
