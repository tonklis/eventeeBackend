class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :url
      t.string :name
      t.text :description
      t.integer :location_id
      t.integer :thumbnail_id

      t.timestamps
    end
  end
end
