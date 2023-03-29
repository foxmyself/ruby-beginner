first_num = 0
second_num = 1

fibonachi = []

while first_num <= 100 do 
  fibonachi.push(first_num)
  first_num, second_num = second_num, first_num + second_num
end 

print fibonachi