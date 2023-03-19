puts "Как вас зовут?"
name = gets.chomp

puts "Какой ваш рост?"
height = gets.chomp.to_i

weight = (height- 110) * 1.15

if weight.positive? 
  puts "#{name}, ваш идеальный вес #{weight.round} кг"
else 
  puts "Ваш вес уже оптимальный"
end

