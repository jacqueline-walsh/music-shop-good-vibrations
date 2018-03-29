Rails.application.routes.draw do
  devise_for :users 
  resources :listings do
    resources :reviews, except: [:show, :index]  
   end

  resources :order_items
  resource :cart, only: [:show] 

  resources :messages do
    resources :comments
  end
  
  root 'listings#index'

  get 'shop' => "listings#shop"
  get 'seller' => "listings#seller"

end
