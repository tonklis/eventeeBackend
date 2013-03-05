class AddCreatorToAssets < ActiveRecord::Migration
  def change
  	add_column :assets, :creator_id, :integer
  end
end
