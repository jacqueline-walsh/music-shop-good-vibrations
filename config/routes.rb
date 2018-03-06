Rails.application.routes.draw do
  devise_for :users
  resources :listings do
    resources :reviews, except: [:show, :index]
   end
   
  #get 'home/index'
  root 'listings#index'
  get 'home/about'

  get 'seller' => "listings#seller"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#root 'home#index'

end
