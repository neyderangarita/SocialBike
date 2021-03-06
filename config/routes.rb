Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'pages#main'

    resources :conditions, :profiels, :routes
    
    resources :events do 
        resources :comments, only: [:index, :create]
    end

    post 'events/:idEvent/assists/:id', to: 'users#assist'
    
    delete 'events/:idEvent/assists/:id', to: 'users#cancel_assist'

    get  'events/assists/:id', to: 'users#show_assist'
       
    post 'auth/login', to: 'authentication#authenticate'
    
    post 'signup', to: 'users#create'  
    
    post '/users/password_reset', to: 'users#password_reset'
  
end
