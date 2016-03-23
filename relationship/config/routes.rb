Rails.application.routes.draw do
  resources :notes
  resources :offers
  resources :tasks
  resources :projects
  resources :contacts
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root 'root#index'
end
