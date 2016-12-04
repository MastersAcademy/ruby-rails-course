require 'set';

# Arrays
figures = [0, 1, 2, 3, 4, 5, 6, 7]
letters = %w(c d e f)

figures.push(8, 9)
letters.unshift('a', 'b')

array_symbols = figures + letters

p array_symbols

# Hashs
hash_colors = {red: 'ff0000', green: '00ff00', blue: '0000ff'}

p hash_colors
p hash_colors.keys

# Sets
set_colors = Set.new

set_colors.merge(hash_colors.values)

until set_colors.size >= 10 do
  color = array_symbols.shuffle.slice(0, 6).join

  set_colors.add(color)
end

p set_colors
p set_colors.length
