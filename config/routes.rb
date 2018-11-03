Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
resources :users

resources :assistants


resources :conditions

resources :events do 
    resources :comments
end

resources :profiels

resources :routes
  
end
