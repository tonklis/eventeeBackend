class Event < ActiveRecord::Base

	#
	attr_accessible :creator_id
		
	has_and_belongs_to_many :users
	has_many :requests
	has_many :invitations
	belongs_to :location
	belongs_to :creator, :class_name => "User", :foreign_key => :creator_id

  has_one :thumbnail, :as => :assetable, :class_name => "Thumbnail"	
  has_many :pictures, :as => :assetable, :class_name => "Picture"	
  has_many :documents, :as => :assetable, :class_name => "Document"	
  has_many :videos, :as => :assetable, :class_name => "Video"

end
