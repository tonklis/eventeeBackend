Eventee::Application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  resources :comments
  resources :assets
  resources :invitations
  resources :requests
  resources :locations
  resources :events
  resources :event_steps
  resources :users

	devise_scope :user do
    get "logout", :to => "devise/sessions#destroy", :as => :logout
    get "signin", :to => "devise/sessions#new", :as => :signin
    get "signup", :to => "devise/registrations#new", :as => :signup
  end

  root to: 'display#index'
end
