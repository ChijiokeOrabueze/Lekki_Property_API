

class FetchPropertiesContract < Dry::Validation::Contract
    params do
        optional(:id).filled(:integer)
        optional(:num_bedrooms).filled(:integer)
        optional(:num_sitting_rooms).filled(:integer)
        optional(:num_kitchen).filled(:integer)
        optional(:num_toilets).filled(:integer)
        optional(:num_bathrooms).filled(:integer)
        
        optional(:property_address).filled(:string, min_size?: 3, max_size?: 200)
        optional(:property_type).filled(:string, min_size?: 3, max_size?: 100)
        optional(:owner).filled(:string, min_size?: 3, max_size?: 200)
    end
end

