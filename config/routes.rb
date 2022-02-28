Rails.application.routes.draw do
  get 'pages/new'
  get 'projects/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#home'

  get '/new', to:'tasks#new'
  post '/create', to:'tasks#create'
  get '/:id/edit', to: 'tasks#edit'
  patch '/:id/update', to:'tasks#update'
  post '/:id/destroy', to:'tasks#destroy'

  get '/new', to:'projects#new'
  post '/create2', to:'projects#create_project'
  get '/edit_project/:id', to:'projects#edit_project', as: 'edit_project'
  patch '/update_project/:id', to:'projects#update_project', as: 'update_project'
  #post '/destroy_project/:id', to:'projects#destroy_project', as: 'destroy_project'

  get '/by_project', to:'pages#by_project'

  #match '/by_project/:id', to:'pages#by_project'

  resources :tasks
  #resources :projects
end
