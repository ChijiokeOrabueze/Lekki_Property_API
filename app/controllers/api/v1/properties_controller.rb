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

                with_validated_params(CreatePropertyContract.new) do |params|

                    begin
                
                        property = Property.new(params)

                        if property.save
                            render json: {status: "success", message: "successfully fetched all properties.", data: property}, status: :ok
                        else
                            render json: {status: "error", message: "Request unsuccessful.", errors: property.errors},status: :bad_request
                        end
                    rescue
                        render json: {status: "error", message: "Something went wrong. Please try again later.", errors: "Something went wrong. Please try again later."},status: :bad_request
                    end
                end

            end


            def update

                with_validated_params(UpdatePropertyContract.new) do |params|
                    begin

                        property = Property.find(params[:id])

                        if property.update(params)
                            render json: {status: "success", message: "successfully fetched all properties.", data: Property.find(params[:id])}, status: :ok
                        else 
                            render json: {status: "error", message: "Request unsuccessful.", errors: property.errors}, status: :bad_request
                        
                        end

                    rescue ActiveRecord::RecordNotFound
                        render json: {status: "error", message: "Requested property not found.", errors: "Requested property not found."},status: :bad_request
                    rescue
                        render json: {status: "error", message: "Something went wrong. Please try again later.", errors: "Something went wrong. Please try again later."},status: :bad_request
                    
                    end
                end
            
            end


            private

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