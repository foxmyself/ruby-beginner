require './station.rb'
require './train.rb'
require './route.rb'
require './cargo_train.rb'
require './passenger_train.rb'
require './wagon.rb'
require './cargo_wagon.rb'
require './passenger_wagon.rb'
require './company.rb'
require './instance_counter.rb'

station1 = Station.new("St.Peterburg")
station2 = Station.new("Мoscow")
station3 = Station.new("Khabarovsk")

Station.all 

train1 = CargoTrain.new(23)
train2 = CargoTrain.new(13)
train3 = PassengerTrain.new(45)

Train.find(23)
Train.find(49)

route1 = Routes.new(station1,station2)

train1.set_company_name("r")

train1.get_company_name

puts CargoTrain.instances 
puts Station.instances
puts Routes.instances


