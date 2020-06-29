Rails.application.routes.draw do
  get '/', to: 'sessions#new'
 
  resources :users do
    resources :folders
  end
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
