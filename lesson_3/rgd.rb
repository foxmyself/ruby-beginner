require './station.rb'
require './train.rb'
require './route.rb'

station1 = Station.new("Санкт-Петербург")
station2 = Station.new("Москва")
station3 = Station.new("Хабаровск")
station4 = Station.new("Владивосток")
station5 = Station.new("Уфа")

train1 = Train.new(324, "Грузовой", 12)
train2 = Train.new(524, "Грузовой", 12)
train3 = Train.new(54, "Пассажирский", 13)

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
station2.show_trains_type("Грузовой")
station2.send_train(train1)

train3.current_speed(100)
train1.current_speed(200) 
train2.current_speed(260)

train3.stop

train3.add_wagons
train2.delete_wagons

train3.get_route(route2)

train3.moving_next_station 
train3.moving_next_station
train3.moving_next_station

#station3.show_trains

train3.moving_previous_station
train3.moving_previous_station
train3.moving_previous_station







