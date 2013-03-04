class Asset < ActiveRecord::Base
	belongs_to :assetable, :polymorphic => true
	has_many :comments
  delegate :url, :to => :attachment
end
