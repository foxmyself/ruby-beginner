class Train 
  attr_reader :number, :type
  attr_accessor :amount_wagons, :speed
  attr_accessor :previous_station, :current_station, :next_station
  
  
  def initialize(number, type, amount_wagons)
    @number = number
    @type = type
    @amount_wagons = amount_wagons
    @speed = 0
    @wagons_train = []
    @current_station = nil
  end  

  def current_speed(speed)
    @speed += speed
    puts "Teкущая скорость поезда №#{@number} равна #{@speed} км/ч" 
  end
  
  def stop 
    @speed = 0
  end

  def add_wagons
    if @speed == 0
       @amount_wagons += 1
      puts "Количество вагонов в поезде №#{@number}, после прицепки составляет #{@amount_wagons}"
    end
  end
  
  def delete_wagons
    if @speed == 0
       @amount_wagons -= 1
      puts "Количество вагонов в поезде №#{@number}, после отцепки составляет #{@amount_wagons}"
    end
  end
  
  def get_route(route) 
    @route = route
    @current_station = route.start_station
    @route.start_station.get_train(self)
    puts "Поезд №#{@number} начинает маршрут со станции #{@current_station.name}"
  end


  def moving_next_station
    @current_station.send_train(self)
    next_station_index = @route.stations.index(@current_station) + 1
    if next_station_index <= @route.stations.length - 1 
      @current_station = @route.stations[next_station_index] 
      @current_station.get_train(self) 
      puts "Cледующая станция: #{@current_station.name}" 
    else 
      puts "Поезд прибыл на конечную станцию маршрута: #{@current_station.name}"
    end
  end
    
  def moving_previous_station 
    @current_station.send_train(self)
    previous_station_index = @route.stations.index(@current_station) - 1
    if previous_station_index <= @route.stations.length - 1 && previous_station_index >= 0
      @current_station = @route.stations[previous_station_index] 
      @current_station.get_train(self) 
      puts "Cледующая станция: #{@current_station.name}"   
    else                                                     
      puts "Поезд прибыл на начальную станцию маршрута: #{@current_station.name}"
    end
  end                                                                                           
end 





  







