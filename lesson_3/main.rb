require './station.rb'
require './train.rb'
require './route.rb'
require './cargo_train.rb'
require './passenger_train.rb'
require './cargo_wagon.rb'
require './passenger_wagon.rb'

class Main 
  attr_reader :item

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
  end

  def show_item
    loop do
    puts "Введите: 
    1 - чтобы создать станцию 
    2 - чтобы создать маршрут 
    3 - чтобы создать поезд  
    4 - чтобы создать вагон 
    5 - чтобы добавить станцию в маршрут 
    6 - чтобы удалить станцию из маршрута 
    7 - чтобы прицепить вагон к поезду  
    8 - чтобы отцепить вагон от поезда 
    9 - чтобы назначить маршрут поезду 
    10 - чтобы отправить поезд на следующую станцию 
    11 - чтобы отправить поезд на предыдущую станцию  
    12 - чтобы посмотреть список станций 
    13 - чтобы посмотреть список поездов на станции
    0 -  чтобы выйти из программы" 
      @item = gets.chomp.to_s
      select_item
    end
  end

  def select_item
    case @item
    when "1"
      create_station
    when "2"
      create_route
    when "3"
      create_train
    when "4"
      create_wagon
    when "5"
      add_station
    when "6" 
      delete_station 
    when "7"
      add_wagon 
    when "8"
      delete_wagons 
    when "9"
      set_route 
    when "10"
      moving_next_station
    when "11"
      moving_previous_station
    when "12"
      show_list_stations
    when "13"
      show_trains
    when "0"
       exit_program
    else 
      puts "Вы ввели некорректный пункт меню." 
    end
  end 

  def create_station  
    puts "Введите название станции:"
    name = gets.chomp.to_s 
    station = Station.new(name)
    @stations << station
    puts "Создана станция \"#{station.name}\" "
  end 

  def create_route
    if @stations.size < 2
      puts "Для создания маршрута необходимо создать две станции."
      create_station
    else
      puts "Выберите начальную станцию маршрута:"
      @stations.each_with_index {|station, index| puts "#{index + 1} : \"#{station.name}\""}
      start_station = @stations[gets.chomp.to_i - 1]
      puts "Начальная станция маршрута #{start_station.name}"
      puts "Выберите конечную станцию маршрута:"
      @stations.each_with_index {|station, index| puts "#{index + 1} : \"#{station.name}\""}
      end_station = @stations[gets.chomp.to_i - 1]
      puts "Конечная станция маршрута #{end_station.name}"
      route = Routes.new(start_station, end_station)
      @routes << route
      puts "Cоздан маршрут: \"#{start_station.name} - #{end_station.name}\""
    end
  end

  def create_train   
    puts "Введите номер поезда:"
    number = gets.chomp.to_s 
    puts "Выберите тип поезда: 1 - passenger или 2 - cargo"
    while choice = gets.chomp.to_s
      case choice  
      when "1"
        type = :passenger 
        train = PassengerTrain.new(number, type)
        @trains << train
        puts "Создан пассажирский поезд №#{train.number}"
        break
      when "2"
        type = :cargo
        train = CargoTrain.new(number, type)
        @trains << train
        puts "Cоздан грузовой поезд №#{train.number}"
        break  
      else
        puts "Вы ввели некорректные данные. Выберите: 1 - passenger или 2 - cargo"
      end
    end
  end
  
  def create_wagon 
    puts "Выберите тип создаваемого вагона: 1 - passenger или 2 - cargo"
    while сhoice = gets.chomp.to_s
      case сhoice
      when "1"
        type = :passenger 
        wagon = PassengerWagon.new(type)
        @wagons << wagon 
        puts "Создан #{wagon.type} вагон."
        break
      when "2"
        type = :cargo
        wagon = CargoWagon.new(type)
        @wagons << wagon 
        puts "Создан #{wagon.type} вагон."
        break
      else
        puts "Вы ввели некорректные данные. Выберите: 1 - passenger или 2 - cargo"
     end
    end
  end
    
  def add_station 
    route = select_route
    puts "Выбран маршрут: \"#{route.start_station.name} - #{route.end_station.name}\""
    puts "Выберите станцию для добавления в маршрут:"
    station = list_stations
    if route.stations.include?(station)
      puts "Станция \"#{station.name}\" уже входит в маршрут."
    else
      route.stations.push(station)
      puts "Станция \"#{station.name}\" добавлена в маршрут." 
    end
  end 

  def delete_station 
    route = select_route
    puts "Выбран маршрут: \"#{route.start_station.name} - #{route.end_station.name}\""
    puts "Выберите станцию для удаления из маршрута:"
    station = list_stations
    if ! route.stations.include?(station)
      puts "Станция \"#{station.name}\" не входит в маршрут. Выберите другую станцию из списка:" 
      station = list_stations
      route.stations.delete(station)
      puts "Станция \"#{station.name}\" удалена из маршрута."
    elsif route.stations.size <= 2
      puts "Нельзя удалить эту станцию, так в маршруте должно быть не менее двух станций."
    else
        route.stations.delete(station)
        puts "Станция \"#{station.name}\" удалена из маршрута."
    end
  end

  def select_train 
    if @trains.empty? 
      puts "Сначала необходимо создать поезд." 
      create_train
      puts "Выберите номер поезда из списка:"  
      @trains.each_with_index {|train, index| puts "#{index + 1} : №#{train.number}, #{train.type} поезд"}
      train = @trains[gets.chomp.to_i - 1]
    else
      puts "Выберите номер поезда из списка:"  
      @trains.each_with_index {|train, index| puts "#{index + 1} : №#{train.number}, #{train.type} поезд"}
      train = @trains[gets.chomp.to_i - 1]
    end
  end

  def select_wagon 
    if @wagons.empty? 
     puts "Сначала необходимо создать вагон."  
      create_wagon
      puts "Выберите вагон из списка:"  
      @wagons.each_with_index {|wagon, index| puts "#{index + 1} : #{wagon.type} вагон"} 
      wagon = @wagons[gets.chomp.to_i - 1]
    else
      puts "Выберите вагон из списка:"  
      @wagons.each_with_index {|wagon, index| puts "#{index + 1} : #{wagon.type} вагон"} 
      wagon = @wagons[gets.chomp.to_i - 1]
    end
  end

  def select_route 
    if @routes.empty?
      puts "Сначала необходимо создать маршрут." 
      create_route 
      puts "Выберите маршрут из списка:"  
      @routes.each_with_index {|route, index| puts "#{index + 1} : \"#{route.start_station.name} - #{route.end_station.name}\""}
      route = @routes[gets.chomp.to_i - 1] 
    else 
      puts "Выберите маршрут из списка:"  
      @routes.each_with_index {|route, index| puts "#{index + 1} : \"#{route.start_station.name} - #{route.end_station.name}\""}
      route = @routes[gets.chomp.to_i - 1]
    end
  end
  
  def add_wagon 
    train = select_train
    wagon = select_wagon
    if train.type == wagon.type
       train.add_wagon(wagon)
       puts "Поезд №#{train.number} прицепил #{wagon.type} вагон"
    else 
      puts "Вагон не добавлен.Tип поезда и вагона должны совпадать."
    end
  end   

  def delete_wagon
    train = select_train
    wagon = select_wagon   
    if train.type == wagon.type 
      train.delete_wagon(wagon)
      puts "Поезд №#{train.number} отцепил #{wagon.type} вагон"
    else 
      puts "Вагон не добавлен.Tип поезда и вагона должен совпадать"
    end
  end 

  def set_route
    train = select_train 
    route = select_route
    train.set_route(route)
  end
  
  def moving_next_station 
    train = select_train
    if train.routes.empty?
      route = select_route
      train.set_route(route)
      train.moving_next_station
    else
      train.moving_next_station 
    end 
  end
  
  def moving_previous_station 
    train = select_train
    if train.routes.empty?
      route = select_route
      train.set_route(route)
      train.moving_previous_station
    else
      train.moving_previous_station
    end 
  end 
  
  def list_stations
    if @stations.empty?
      puts "Нет созданных станций. Создайте станцию."
      create_station
    else
      puts "Cписок станций:"
      @stations.each_with_index {|station, index| puts "#{index + 1} : \"#{station.name}\""}
      station = @stations[gets.chomp.to_i - 1]
    end 
  end
  
  def show_list_stations 
    if @stations.empty?
      puts "Нет созданных станций. Создайте станцию."
      create_station
    else
      puts "Cписок станций:"
      @stations.each_with_index {|station, index| puts "#{index + 1} : \"#{station.name}\""}
    end 
  end

  def show_trains 
    station = list_stations 
    if station.trains.empty? 
      puts "На станции нет поездов."    
    else 
      station.show_trains  
    end
  end
  
  def exit_program
    puts "Вы вышили из меню. Чтобы открыть его заново нажмите ENTER"
    gets.chomp
  end
end





  