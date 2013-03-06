class AddUniqueFieldToEvent < ActiveRecord::Migration
  def change
    add_index :events, :url, :unique => true
  end
end
