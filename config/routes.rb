Rails.application.routes.draw do
  resources :environments
  resources :traits
  resources :employers
  resources :listings
  root "explorers#index"
  devise_for :explorers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
