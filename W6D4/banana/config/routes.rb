Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :index, :create, :update, :destroy]

  resources :artwork_shares, only: [:create, :destroy]

  resources :artworks, only: [:show, :create, :update, :destroy]

  resources :comments, only: [:index,:destroy,:create]

  get "/artwork_shares/:id", to: "artwork_shares#index"
  get "/users/:user_id/artworks", to: "artworks#index"

  # get "/comments/:id", to: "comments#index"
  #get "/users/:user_id/artworks/:artwork_id/comments", to: "comments#index" 
  # post "/users", to: "users#create", as: "new_user"
  # get "/users", to: "users#new"
  # get "/users/:id", to: "users#edit"
  # get "/users/:id", to: "users#show"
  # patch "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"
  
end
