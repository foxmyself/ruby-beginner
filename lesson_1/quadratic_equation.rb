puts "Введите a, b , c."
a = gets.chomp.to_f 
b = gets.chomp.to_f 
c = gets.chomp.to_f 

d = b ** 2 - 4 * a * c
puts d

if d > 0
  sqrt_d = Math.sqrt(d)
  x1 = (sqrt_d  - b) / (2 * a) 
  x2 = (-sqrt_d - b) / (2 * a)
  puts "Дискриминант равен #{d.round(1)}, а корни квадратного уравнения равны #{x1.round(1)} и #{x2.round(1)}"
elsif d == 0
   x = -b / (2 * a)
   puts "Дискриминант равен нулю, корень равен #{x.round(1)}"
else  
  puts "Корней нет"
end