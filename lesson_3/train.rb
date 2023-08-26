class Train 
  attr_reader :number, :type, :routes
  attr_accessor :speed
  attr_accessor :previous_station, :current_station, :next_station
  
  
  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
    @current_station = nil
    @routes = []
  end  

  def current_speed(speed)
    @speed += speed
    puts "Teкущая скорость поезда №#{@number} равна #{@speed} км/ч" 
  end
  
  def stop 
    @speed = 0
  end
  
  def add_wagon(wagon) 
    if @speed == 0 && wagon.type == type
    @wagons << wagon
    end 
  end    
  
  def delete_wagon(wagon)
    if @speed == 0
    @wagons.delete(wagon)
    end
  end

  def show_wagons
    @wagons.size 
    puts "Количество вагонов в поезде №#{@number} равно #{@wagons.size}"
  end

  def set_route(route) 
    @route = route 
    @routes << route
    @current_station = route.start_station
    route.start_station.get_train(self)
    puts "Поезд №#{self.number} принял маршрут:\"#{route.start_station.name} - #{route.end_station.name}\""
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






  







