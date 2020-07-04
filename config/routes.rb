Rails.application.routes.draw do
  get '/', to: 'sessions#new'
 
  resources :users do
    resources :folders
  end
  get '/folder/:folder_id/files/new', to: 'user_files#new', as: 'new_file'
  post '/folder/:folder_id/files/create', to: 'user_files#create', as: 'create_file'
  get '/files/:file_id', to: 'user_files#show', as: 'download' 
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
