Rails.application.routes.draw do
  resources :city
  resources :gossip
  resources :profile
  resources :welcome
  resources :session, only: [:new, :create, :destroy]
  resources :register
  get 'contact', to: 'static#contact'
  get 'team', to: 'static#team'
  get '/', to:'static#index'
  #à chaque création de route,  "$ rails g controller welcome bonjour_name"
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
