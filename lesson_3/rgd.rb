require './station.rb'
require './train.rb'
require './route.rb'
require './cargo_train.rb'
require './passenger_train.rb'
require './wagon.rb'
require './cargo_wagon.rb'
require './passenger_wagon.rb'

station1 = Station.new("St.Peterburg")
station2 = Station.new("Мoscow")
station3 = Station.new("Khabarovsk")
station4 = Station.new("Vladivostok")
station5 = Station.new("Novosibirsk")

train1 = CargoTrain.new(324)
train2 = CargoTrain.new(524)
train3 = PassengerTrain.new(54)

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

cargowagon = CargoWagon.new
cargowagon1 = CargoWagon.new
cargowagon2 = CargoWagon.new
passengerwagon1 = PassengerWagon.new

cargotrain1 = CargoTrain.new(185)
passengertrain1 = PassengerTrain.new(169)

cargotrain1.current_speed(0)
passengertrain1.current_speed(0)

cargotrain1.add_wagon(cargowagon)
cargotrain1.add_wagon(cargowagon2)
cargotrain1.add_wagon(cargowagon1)

cargotrain1.show_wagons

passengertrain1.add_wagon(passengerwagon1)

cargotrain1.delete_wagon(cargowagon1)
cargotrain1.delete_wagon(cargowagon2)

passengertrain1.show_wagons

