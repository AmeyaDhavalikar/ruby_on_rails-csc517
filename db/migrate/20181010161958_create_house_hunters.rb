class CreateHouseHunters < ActiveRecord::Migration[5.1]
  def change
    create_table :house_hunters do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :phone
      t.string :preffered_contact

      t.timestamps
    end
  end
end
