class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :omniauthable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :uid, :phone, :country, :social_url_1, :social_url_2, :social_url_3, :social_url_4, :thumbnail_url, :picture_attributes
	has_and_belongs_to_many :events
	has_many :created_events, :class_name => "Event", :foreign_key => :creator_id
	has_many :requests
	has_many :comments
	has_one :picture, :as => :assetable, :class_name => "Picture"

	validates_presence_of :first_name, :email, :last_name
	accepts_nested_attributes_for :picture

	def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
		user = User.where(:email => auth.info.email).first
		unless user
			# CHECK FOR NEW/CREATE
			user = User.create(first_name:auth.info.first_name,
												 last_name:auth.info.last_name,
						 uid:auth.uid,
						 email:auth.info.email,
						 password:Devise.friendly_token[0,20],
						 thumbnail_ur: "http://graph.facebook.com/#{auth.id}/picture?type=large"
			)
		end
		user
	end
	
	def self.login(email, first_name, last_name, uid)
		user = User.find_by_uid(uid)
		if not user
			user = User.create(:email => email, :first_name => first_name, :last_name => last_name, :uid => uid)
		elsif not user.email
			user.update_attributes(:email => email, :first_name => first_name, :last_name => last_name)
		end
		user
	end

end
