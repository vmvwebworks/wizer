require "wizer/version"
require 'rest-client'
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
        "http://api.tiempo.com/index.php?api_lang=es&localidad=#{location_id}&affiliate_id=#{affiliate_id}"
      end
      def min_temperature_this_week
        RestClient.get request_url
      end
      def max_temperature_this_week
      end
      def temperature_now

      end
    end

  # TODO It's possible to add more sites, use below code as template
  # class OtherWeatherSite
  #   code here...
  # end
end
