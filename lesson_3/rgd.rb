require './station.rb'
require './train.rb'
require './route.rb'
require './cargo_train.rb'
require './passenger_train.rb'
require './cargo_wagon.rb'
require './passenger_wagon.rb'

station1 = Station.new("St.Peterburg")
station2 = Station.new("Мoscow")
station3 = Station.new("Khabarovsk")
station4 = Station.new("Vladivostok")
station5 = Station.new("Novosibirsk")

train1 = Train.new(324, "cargo")
train2 = Train.new(524, "cargo")
train3 = Train.new(54, "passenger")

route1 = Routes.new(station1,station2)
route2 = Routes.new(station4,station3)
route2.add_station(station2)
route1.add_station(station3)
route1.add_station(station5)
route1.delete_station(station3)
route2.show_stations
route1.show_stations

station2.get_train(train1)
station2.get_train(train2)
station2.get_train(train3)
station2.show_trains
station2.show_trains_type("cargo")
station2.send_train(train1)

train3.current_speed(100)
train1.current_speed(200) 
train2.current_speed(260)

train3.stop

train3.set_route(route2)

train3.moving_next_station 
train3.moving_next_station
train3.moving_next_station

train3.moving_previous_station
train3.moving_previous_station
train3.moving_previous_station

cargowagon = CargoWagon.new("cargo")
cargowagon1 = CargoWagon.new("cargo")
cargowagon2 = CargoWagon.new("cargo")
passengerwagon1 = PassengerWagon.new("passenger")

cargotrain1 = CargoTrain.new(185,"cargo")
passengertrain1 = PassengerTrain.new(169,"passenger")

cargotrain1.current_speed(0)
passengertrain1.current_speed(0)

cargotrain1.add_wagons(cargowagon)
cargotrain1.add_wagons(cargowagon2)
cargotrain1.add_wagons(cargowagon1)

cargotrain1.show_wagons

passengertrain1.add_wagons(passengerwagon1)

cargotrain1.delete_wagons(cargowagon1)
cargotrain1.delete_wagons(cargowagon2)

passengertrain1.show_wagons

