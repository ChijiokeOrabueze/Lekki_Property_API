class Property < ApplicationRecord
    validates :property_address, :property_type, :num_bedrooms, :num_sitting_rooms, :num_kitchen, :num_toilets, :num_bathrooms, :owner, :description, :valid_from, presence: true
end
