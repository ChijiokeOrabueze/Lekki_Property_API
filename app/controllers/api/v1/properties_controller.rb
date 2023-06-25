module Api
    module V1
        class PropertiesController < ApplicationController

            def index
                with_validated_params(FetchPropertiesContract.new) do |params|

                    begin

                        properties = PropertyManager::PropertyFetcher.call(params)

                        render json: {status: "success", message: "successfully fetched all matching properties.", data: properties}, status: :ok

                    rescue
                        render json: {status: "error", message: "Request unsuccessful.", error: properties.errors}, status: :ok

                    end
                end
            end


            def create 
                
                property = Property.new(properties_body)

                if property.save
                    render json: {status: "success", message: "successfully fetched all properties.", data: property}, status: :ok
                else
                    render json: {status: "error", message: "Request unsuccessful.", errors: property.errors},status: :bad_request
                end

            end


            def update

                property = Property.find(params[:id])

                if property.update(properties_update)
                    render json: {status: "success", message: "successfully fetched all properties.", data: property}, status: :ok
                else 
                    render json: {status: "error", message: "Request unsuccessful.", errors: property.errors}, status: :bad_request
                
                end
            
            end


            private

            def properties_body
                params.permit(:property_address, :property_type, :num_bedrooms, :num_sitting_rooms, :num_kitchen, :num_toilets, :num_bathrooms, :owner, :description, :valid_from)
            end

            def properties_update
                params.permit(:num_bedrooms, :num_sitting_rooms, :num_kitchen, :num_toilets, :num_bathrooms, :description, :valid_from)
            end

            def with_validated_params(schema)
                result = schema.call(params.to_unsafe_hash)
            
                if result.success?
                  yield result.to_h
                else
                    render json: {status: "failed", message: "Request unsuccessful.", error: result.errors.to_h}, status: :bad_request
                end
            end
        end
    end
end