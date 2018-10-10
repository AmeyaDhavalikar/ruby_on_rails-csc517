Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions
  resources :inquiries
  resources :houses
  resources :real_estate_companies

  root 'static_pages#index'

  # Static pages show
  get '/', to: 'static_pages#index'
  get '/index', to: 'static_pages#index'

  # User CRUD operations
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users', to: 'users#show'
  get '/user/:id', to: 'users#edit'
  put '/user/:id', to: 'users#update'
  patch '/user/:id', to: 'users#update'
  delete '/user/:id', to: 'users#destroy'


  # Session CD operations
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/home', to: 'static_pages#home'

  # Real Estate CRUD operations
  get '/addcompany', to: 'real_estate_companies#new'
  post '/addcompany', to: 'real_estate_companies#create'
  get '/companies', to: 'real_estate_companies#show'
  get '/company/:id', to: 'real_estate_companies#edit'
  put '/company/:id', to: 'real_estate_companies#update'
  patch '/company/:id', to: 'real_estate_companies#update'
  delete '/company/:id', to: 'real_estate_companies#destroy'

  # House CRUD operations
  #get '/listhouse', to: 'houses#new'
  #post '/listhouse', to: 'houses#create'
  #get '/houses', to: 'houses#show'
  #get '/house/:id', to 'houses#edit'
  #put '/house/:id', to: 'houses#update'
  #patch '/house/:id', to: 'houses#update'
  #delete '/house/:id', to: 'houses#destroy'

  # Inquiry CRUD operations
  #get '/addinquiry', to: 'inquiries#new'
  #post '/addinquiry', to: 'inquiries#create'
  #get '/inquiries', to: 'inquiries#show'
  #get '/inquiry/:id', to: 'inquiries#edit'
  #put '/inquiry/:id', to: 'inquiries#update'
  #patch '/inquiry/:id', to: 'inquiries#update'
  #delete '/inquiry/:id', to: 'inquiries#destroy'

end
