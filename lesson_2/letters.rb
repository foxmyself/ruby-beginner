alpabet = ('a'..'z').to_a

letters_vowels = ["a", "e", "i", "o", "u", "y"]

vowels = {}

alpabet.each_with_index do |l, i|
  vowels[l] = i + 1 if letters_vowels.include?(l)
end

puts "Порядковый номер буквы в алфавите:"
puts vowels

