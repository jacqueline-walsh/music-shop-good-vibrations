Rails.application.routes.draw do
  resources :checkouts
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
  get 'buyer' => "order_items#purchases"
  get 'sales' => "order_items#sales"  
  get 'checkout' => "checkouts#new"
  get 'checkout/thank-you' => "carts#thank_you"

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#root 'home#index'

end
