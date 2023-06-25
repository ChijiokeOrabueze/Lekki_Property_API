require 'date'

BasicPropertySchema = Dry::Schema.Params do
        required(:num_bedrooms).filled(:integer)
        required(:num_sitting_rooms).filled(:integer)
        required(:num_kitchen).filled(:integer)
        required(:num_toilets).filled(:integer)
        required(:num_bathrooms).filled(:integer)
        
        required(:description).filled(:string, min_size?: 3, max_size?: 200)

        required(:valid_from).filled(:date)
        optional(:valid_to).filled(:date)
    end