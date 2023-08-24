class CargoTrain < Train
  # attr_reader :type

  def add_wagon(wagon) 
    super if wagon.type == 'cargo' 
  end
  
  def show_wagons
    @wagons.size 
    puts "Количество вагонов в поезде №#{@number} равно #{@wagons.size}"
  end
end

 

   
