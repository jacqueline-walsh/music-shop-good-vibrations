Rails.application.routes.draw do
  devise_for :users 
  resources :listings do
    resources :reviews, except: [:show, :index]  
   end
     resources :order_items

    resource :cart, only: [:show] 

  #get 'home/index'
  root 'listings#index'
  get 'home/about'

  get 'shop' => "listings#shop"
  get 'seller' => "listings#seller"
  get 'buyer' => "order_items#purchases"


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#root 'home#index'

end
