require 'sinatra'
require 'shotgun'
require 'rubygems'
require 'wunderground'
require 'pry'


w_api = Wunderground.new("1779229ef99fe40b")
#boston_forcast = w_api.forecast_for("MA","Boston")
boston_conditions = w_api.conditions_for("MA","Boston")
#binding.pry

city_state = boston_conditions["current_observation"]["display_location"]["full"]
current_city = boston_conditions["current_observation"]["display_location"]["city"]
current_state = boston_conditions["current_observation"]["display_location"]["state_name"]
current_last_refreshed = boston_conditions["current_observation"]["observation_time"]
current_overview = boston_conditions["current_observation"]["weather"]
current_temp = boston_conditions["current_observation"]["temperature_string"]
current_humidity = boston_conditions["current_observation"]["relative_humidity"]
current_wind = boston_conditions["current_observation"]["wind_string"]


get '/' do
  @current_place = city_state
  @city = current_city
  @state = current_state
  @overview = current_overview
  @temperature = current_temp
  @humidity = current_humidity
  @wind = current_wind
  @last_refresh = current_last_refreshed
  erb :index
end
