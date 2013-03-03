class Video < Asset
	has_attached_file :attachment,
		:styles => { :x_large => "1600x1200>", large: "1000x1000>", medium: "600x600>", small: "300x300>", x_small: "150x150>" }, storage: :s3, bucket: ENV['AWS_BUCKET'], s3_credentials: {access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']}

end
