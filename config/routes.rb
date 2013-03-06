Eventee::Application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  resources :comments
  resources :assets
	
	resources :invitations do
    match 'confirm_invitation' => 'invitations#confirm', :on => :collection, :as => :confirm
    match 'pending_invitation' => 'invitations#pending', :on => :collection, :as => :pending
	end
  resources :requests do
    match 'revoke' => 'requests#revoke', :on => :collection, :as => :pending
    match 'approve' => 'requests#approve', :on => :collection, :as => :pending
	end
  resources :locations
  resources :events
  resources :event_steps
  resources :users

	devise_scope :user do
    get "logout", :to => "devise/sessions#destroy", :as => :logout
    get "signin", :to => "devise/sessions#new", :as => :signin
    get "signup", :to => "devise/registrations#new", :as => :signup
  end

	match 'send_email', :to => "display#send_email", :as => :send_email
	match 'custom_remove', :to => 'assets#custom_remove', :as => :remove_asset

	match "/:id", :to => "display#unique_page", :as => :unique_page
  root to: 'display#index'
end
