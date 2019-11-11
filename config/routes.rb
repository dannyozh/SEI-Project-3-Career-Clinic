Rails.application.routes.draw do
  devise_for :employers
  resources :environments
  resources :traits
  resources :employers
  resources :listings
  devise_for :explorers
  root "landings#landing"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
