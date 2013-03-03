class User < ActiveRecord::Base
	has_and_belongs_to_many :events
	has_many :created_events, :class_name => "Event", :foreign_key => :creator_id
	has_many :requests
end
