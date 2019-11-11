Rails.application.routes.draw do
  root "explorers#index"
  devise_for :explorers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
