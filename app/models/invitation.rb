class Invitation < ActiveRecord::Base
	belongs_to :event
	attr_accessible :email, :event_id, :sent, :message, :accepted
end
