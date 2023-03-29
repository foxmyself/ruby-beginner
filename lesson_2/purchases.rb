puts "Введите стоп после формирования корзины"
purchases = {}

loop do
  puts "Введите название товара:"
  name = gets.chomp
  break if name == "стоп"

  puts "Введите цену за единицу товара:"
  price = gets.chomp.to_f

  puts "Введите количество товара:"
  amount = gets.chomp.to_f
  
  first_hash = {}
  first_hash[price] = amount 
  purchases[name] = first_hash
end

puts purchases  

basket = 0

purchases.each do |key, value|
  puts "#{key} стоимостью #{value.keys.first * value.values.first}"
  basket += value.keys.first * value.values.first
end

puts "Итоговая сумма всех покупок равна #{basket}"