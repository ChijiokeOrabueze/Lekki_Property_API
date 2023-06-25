class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.text :property_address
      t.string :property_type
      t.integer :num_bedrooms
      t.integer :num_sitting_rooms
      t.integer :num_kitchen
      t.integer :num_toilets
      t.integer :num_bathrooms
      t.string :owner
      t.text :description
      t.date :valid_from
      t.date :valid_to

      t.timestamps
    end
  end
end
