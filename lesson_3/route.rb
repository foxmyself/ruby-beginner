require './instance_counter.rb'

class Routes 
  include InstanceCounter

  attr_reader :start_station, :end_station, :stations
  
  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2,station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_stations 
    puts "Список станций по маршруту:"
    @stations.each {|station| puts "#{station.name}"}
  end
end





