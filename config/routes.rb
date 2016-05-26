Rails.application.routes.draw do

  root 'static_pages#home'
  resources :trips do 
    resources :locations
  end

  resources :items
  resources :locations do
    resources :addresses
  end  
end

 
