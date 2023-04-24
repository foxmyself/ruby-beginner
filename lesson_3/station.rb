class Station 
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end 

  def get_train(train)
    @trains << train  
  end   
    
  def show_trains
    puts "Список поездов на станции \"#{@name}\":"
    @trains.each {|train| puts "поезд № #{train.number},#{train.type}"}
  end
  
  def show_trains_type(type)
     @trains.select {|train| train.type == type}.size  
  end

  def send_train(train)
    @trains.delete(train)
  end
end
  
 