Eventee::Application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  resources :comments
  resources :assets
  resources :invitations
  resources :requests
  resources :locations
  resources :events
  resources :users

	devise_scope :user do
    root to: 'devise/registrations#new'
    get "logout", :to => "devise/sessions#destroy"
    get "signin", :to => "devise/sessions#new"
    get "signup", :to => "devise/registrations#new"
  end
end
