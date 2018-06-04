require "wizer/version"
require "wizer/cli"
require 'rest-client'
require 'json'
module Wizer
  class Tiempo
    def initialize(location_id, affiliate_id)
      @location = location_id
      @affiliate = affiliate_id
    end
    def location_id
      @location
    end
    def affiliate_id
      @affiliate
    end
    def request_url
      "http://api.tiempo.com/index.php?api_lang=es&localidad=#{location_id}&affiliate_id=#{affiliate_id}&v=3.0"
    end
    def temperature_today
      res = []
      req = JSON.parse(RestClient.get request_url)
      res << "temperatures for today"
      req['day'][0]['hour'].each do |hour_temp|
        res << {'interval' => hour_temp['interval'], 'temperature' => hour_temp['temp']}
      end
      res = res.to_json
    end
    def min_temperature_this_week
      mins = []
      req = JSON.parse(RestClient.get request_url)
      req['day'].each do |day|
        mins << {'dayname' => day['name'], 'minumum_temperature' => day['tempmin'].to_i}
      end
      min = mins.min_by { |m| m['minimum_temperature']}
      min = min.to_json
    end
    def max_temperature_this_week
      maxs = []
      req = JSON.parse(RestClient.get request_url)
      req['day'].each do |day|
        maxs << {'dayname' => day['name'], 'maximum_temperature' => day['tempmax'].to_i}
      end
      max = maxs.max_by { |m| m['maximum_temperature']}
      max = max.to_json
    end

  end

  # TODO It's possible to add more sites, use below code as template
  # class OtherWeatherSite
  #   code here...
  # end


end
