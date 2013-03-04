class Comment < ActiveRecord::Base
  attr_accessible :asset_id, :description, :user_id
	belongs_to :user
	belongs_to :asset
end
