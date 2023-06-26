module PropertyManager
    require 'httparty'

    class AddressLocator < ApplicationService

        attr_reader :address
  
        def initialize(address)
            @address = address
        end

        
        def call

            api_key = ENV["GEOPIFY_API_KEY"]

            accept_level = 0.95

            search_address = "#{address}"

            if (!address.downcase().include? "nigeria")
                search_address += ", Nigeria"
            end

            url_string = "https://api.geoapify.com/v1/geocode/search?text=#{search_address}&apiKey=#{api_key}"

            response = HTTParty.get(url_string, format: :json)

            return false if response.code != 200

            check_response = JSON.parse(response.body)

            if check_response["features"].length == 0
                return false
            else
                if check_response["features"][0]["properties"]["rank"]["confidence"] >= accept_level
                    return true
                else
                    return false
                end
            end

        end

        

    end
end