class Asset < ActiveRecord::Base
	belongs_to :assetable, :polymorphic => true
	has_many :comments
	belongs_to :creator, :class_name => "User", :foreign_key => :creator_id 
  delegate :url, :to => :attachment

	attr_accessible :creator_id
end
