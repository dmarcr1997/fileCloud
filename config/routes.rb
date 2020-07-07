Rails.application.routes.draw do
  get '/', to: 'sessions#new', as: 'login'
 
  resources :users do
    resources :folders, only: [:new, :create, :index, :show]
  end
  get '/folder/:folder_id/files/new', to: 'user_files#new', as: 'new_file'
  post '/folder/:folder_id/files/create', to: 'user_files#create', as: 'create_file'
  get '/files/:file_id', to: 'user_files#show', as: 'download' 
  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/users/:user_id/folder/:folder_id/files/:id/destroy', to: 'user_files#destroy', as: 'delete_file'
  get '/users/:user_id/folder/:folder_id/destroy', to: 'folders#destroy', as: 'delete_folder'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
