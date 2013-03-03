class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :description
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
