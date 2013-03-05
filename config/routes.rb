Eventee::Application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  resources :comments
  resources :assets
  resources :invitations do
    match 'confirm_invitation' => 'invitations#confirm', :on => :collection, :as => :confirm
	end
  resources :requests
  resources :locations
  resources :events
  resources :users

	devise_scope :user do
    get "logout", :to => "devise/sessions#destroy", :as => :logout
    get "signin", :to => "devise/sessions#new", :as => :signin
    get "signup", :to => "devise/registrations#new", :as => :signup
  end

	match 'send_email', :to => "display#send_email", :as => :send_email

  root to: 'display#index'
end
