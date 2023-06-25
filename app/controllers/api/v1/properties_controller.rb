module Api
    module V1
        class PropertiesController < ApplicationController

            def index

                if params[:id]
                    properties = Property.find(params[:id])
                else

                    search_hash = [""]
                    search_keys = [
                        "property_address", "property_type", "num_bedrooms", "num_sitting_rooms", "num_kitchen", "num_toilets", "num_bathrooms", "owner", 
                    ];

                    for key in search_keys

                        if params[key] and key != search_keys[search_keys.length() - 1]
                            search_hash[0] += "#{key} = ? and "
                            search_hash.push(params[key])
                        elsif params[key]
                            search_hash[0] += "#{key} = ?"
                            search_hash.push(params[key])
                        end
                    end


                    
                    if (search_hash.length() < 2)
                        properties = Property.order("id DESC")
                    else
                        properties = Property.where(search_hash).order("id DESC")
                    end
                    
                end

                if properties
                    render json: {status: "success", message: "successfully fetched all properties.", data: properties}, status: :ok
                else
                    render json: {status: "error", message: "successfully fetched all properties.", data: []}, status: :ok
                end
            end


            def create 

                puts params
                
                property = Property.new(properties_body)

                if property.save
                    render json: {status: "success", message: "successfully fetched all properties.", data: property}, status: :ok
                else
                    render json: {status: "error", message: "successfully fetched all properties.", data: property.errors}, status: :ok
                end


            end


            def update

                property = Property.find(params[:id])

                if property.update(properties_update)
                    render json: {status: "success", message: "successfully fetched all properties.", data: property}, status: :ok
                else 
                    render json: {status: "error", message: "successfully fetched all properties.", data: property.errors}, status: :ok
                
                end
            
            end


            private

            def properties_body
                params.permit(:property_address, :property_type, :num_bedrooms, :num_sitting_rooms, :num_kitchen, :num_toilets, :num_bathrooms, :owner, :description, :valid_from)
            end

            def properties_update
                params.permit(:num_bedrooms, :num_sitting_rooms, :num_kitchen, :num_toilets, :num_bathrooms, :description, :valid_from)
            end
        end
    end
end