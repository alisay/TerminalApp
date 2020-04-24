require "Geocoder"
require "net/http"
class User    
    attr_reader(:ip)
    def initialize
        begin
        @ip = Net::HTTP.get URI "https://api.ipify.org"
        rescue SocketError
            puts "There is no internet connection!"
            exit
        end
    end
    def country
        Geocoder.search(@ip).first.country
    end
    def city
        Geocoder.search(@ip).first.city
    end
    def coord
        Geocoder.search(@ip).first.coordinates
    end
end
