class PassengerTrain < Train

  def add_wagon(wagon) 
    super if wagon.type == 'passenger'
  end

  def show_wagons
    @wagons.size 
    puts "Количество вагонов в поезде №#{@number} равно #{@wagons.size}"
  end
end
  

 

