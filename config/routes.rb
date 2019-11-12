Rails.application.routes.draw do
  resources :industries
  # devise_for :explorers, controllers: { explorers: "explorers" }
  # devise_for :employers
  devise_for :explorers, controllers: { registrations: "explorers/registrations" }
  devise_for :employers, controllers: { registrations: "employers/registrations" }
  resources :explorers_profiles
  resources :employers_profiles
  resources :environments
  resources :traits
  resources :listings
  root "landings#landing"
  get '/welcome' => "landings#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end