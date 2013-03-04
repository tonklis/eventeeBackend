class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def facebook
		@user = User.find_for_facebook_oauth(auth_hash, current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = auth_hash.except("extra")
      redirect_to signup_url(@user)
    end
		
  end

	def auth_hash
		request.env["omniauth.auth"]
	end

	devise_scope :user do
    get "logout", :to => "devise/sessions#destroy"
    get "signin", :to => "devise/sessions#new"
    get "signup", :to => "devise/registrations#new"
  end

end
