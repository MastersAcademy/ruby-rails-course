h = {
  'yes' => 23,
  'b' => 'travel',
  'yesterday' => 34,
  :yesss => :fg,
  try: 30,
  key: 'some value',
  'yesterday1' => 34,
  'yesteryear' => 2014
}

h.keys.each { |k| h[k.to_s] = h.delete(k) }
puts h.select { |k, v| k.start_with?('yes') }.count
