Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create, :show, :index] do
    resources :notes, only:[:create]
  end

  resources :notes, only:[:edit,:update]

  resource :session, only:[:new, :create, :destroy]
end