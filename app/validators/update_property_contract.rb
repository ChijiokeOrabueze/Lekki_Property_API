

class UpdatePropertyContract < Dry::Validation::Contract
    params(BasicPropertySchema) do
        
        required(:id).filled(:integer)

    end
end