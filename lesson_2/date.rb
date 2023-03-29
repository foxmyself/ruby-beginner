months_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
result = 0 

puts "Введите дату:"
date = gets.chomp.to_i

result = result + date

puts "Введите месяц:"
month = gets.chomp.to_i

puts "Введите год:"
year = gets.chomp.to_i
 
months_days.each_with_index do |days, index|
  if index <= month - 2
    result = result + days 
  end 
end
  
if (year % 4 == 0) || (year % 400 == 0) && (year % 100 == 0)
  result += 1    
end

puts "Порядковый номер даты:#{result}"



