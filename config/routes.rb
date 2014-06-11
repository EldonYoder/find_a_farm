Rails.application.routes.draw do
  devise_for :users
 
  root 'welcome#index'

  resources :farms
  resources :links
 
end
