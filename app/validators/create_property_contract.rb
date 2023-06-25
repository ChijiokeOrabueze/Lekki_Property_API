

class CreatePropertyContract < Dry::Validation::Contract
    params(BasicPropertySchema) do
        
        required(:property_address).filled(:string)
        required(:property_type).filled(:string)
        required(:owner).filled(:string)
        required(:description).filled(:string)

    end
end
