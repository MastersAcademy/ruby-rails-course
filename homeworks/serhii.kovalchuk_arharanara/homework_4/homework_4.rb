#homework_4
require 'set'

vowels_letters = ["a","e","i","o","u",]
puts "vowels letters :"
puts vowels_letters.join ", "
puts "vowels letters count:"
puts vowels_letters.count
puts

consonants_letters = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z"]
puts "consonants letters :"
puts consonants_letters.join ", "
puts "consonants letters count:"
puts consonants_letters.count
puts

alphabet = vowels_letters + consonants_letters
puts "array vowels letters + array consonants letters = array alphabet :"
puts alphabet.join ", "
puts "array alphabet.sort:"
alphabet = alphabet.sort
puts alphabet.join ", "
puts

words = ["apple","bird","car","dog","ear","fish","girl","hair","ice","juice","kitty","lamp","milk","neck","orange","puppy","queen","ruby","sun","towel","umbrella","vegetable","water","xerox","yaght","zebra"]
puts "array words :"
puts words.join ", "
puts

puts "creating a hash of two arrays :"
hash_alphabet = alphabet.zip(words).to_h
puts "puts hash_alphabet :"
puts hash_alphabet
puts

puts "Enter the letter ==> word"
choice = gets.chomp
puts hash_alphabet[choice]
puts
puts "SET---SET---SET---SET---SET---SET---SET"

puts "s - new set"
s = vowels_letters.to_set

puts "puts s.size"
puts s.size

puts "s.include?(anannas)"
puts s.include?("anannas")

puts"s.add(anannas)"
s.add("anannas")

puts "puts s.size"
puts s.size

puts "s.include?(anannas)"
puts s.include?("anannas")


puts "print set :"
s.each do |item|
  print item, ","
end
puts
puts "print set.sort :"
s.sort.each do |x|
  print x, ","
end



