require 'set'

class Collections
  def run

    #Arrays
    languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
    #Iteration
    languages.each{|x| puts x}
    #Range
    puts languages[0..3].join ","
    #Fetch method
    puts languages.fetch(-1)
    #Map method
    puts (languages.map {|item| if item.to_s!= "Ruby";then item;end}).join ","
    #Find method
    languages.find{|words| puts words == "Python"}
    #Grep method with multiplication item
    puts languages.grep(/uby/) {|language| language * 4}

    #Hashes
    #Iterating over the hash
    puts "Text please: "
    text = gets.chomp
    words = text.split(" ")
    frequencies = Hash.new(0)
    words.each { |word| frequencies[word] += 1 }
    frequencies = frequencies.sort_by {|a, b| b }
    frequencies.reverse!
    frequencies.each { |word, frequency| puts word + " " + frequency.to_s }
    #Simple hash
    hash = {"Mojito": 80, "Bronx": 75, "White boom sour": 95, "New york sour": 120}
    hash.each{|c, price| puts "#{c}: #{price}"}

    #Sets
    first = Set.new([1,2,3,4])
    #Method add
    first.add('one')
    #Method add
    first << 'two'
    #Iterating over the set
    first.each{|x| puts x}
    #Array to set
    array = [1,3,5,6].to_set
    array.each{|x| puts x}
  end
end

Collections.new.run


