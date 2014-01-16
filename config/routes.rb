Moviemart::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get '/auth/:provider/callback' => 'authentications#create'
  get '/movies/search' => 'movies#search'
  resources :authentications
  resources :reviews
  resources :movies
  get "home/index"
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root :to => "home#index", :as => 'home'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
end
