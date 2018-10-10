class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :location
      t.string :address
      t.string :house_owner
      t.string :price
      t.string :year_built
      t.integer :floors
      t.integer :basement
      t.integer :style
      t.string :square_footage

      t.timestamps
    end
  end
end
