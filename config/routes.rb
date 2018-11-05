Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
    resources :conditions, :profiels, :routes
    
    resources :events do 
        resources :comments, only: [:index, :create]
    end

    post 'events/:idEvent/assists/:id', to: 'users#assist'
    
    delete 'events/:idEvent/assists/:id', to: 'users#cancel_assist'
    
    post 'auth/login', to: 'authentication#authenticate'
    
    
    post 'signup', to: 'users#create'
    
    
  
end
