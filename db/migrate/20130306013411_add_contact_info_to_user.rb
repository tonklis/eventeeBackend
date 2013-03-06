class AddContactInfoToUser < ActiveRecord::Migration
  def change
  	add_column :users, :asset_id, :integer
  	add_column :users, :country, :string
  	add_column :users, :phone, :string
		add_column :users, :social_url_1, :string
		add_column :users, :social_url_2, :string
		add_column :users, :social_url_3, :string
		add_column :users, :social_url_4, :string
  end
end
