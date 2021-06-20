Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboard#show', as: :signed_in_root
  end

  root to: 'home#show'
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, only: :create

  resources :shouts, only: %i[create show]

  resources :users, only: %i[create show] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[edit update]
  end
  
  get '/sign_in' => 'sessions#new', as: 'sign_in'
  get '/sign_up' => 'users#new', as: 'sign_up'
  delete '/sign_out' => 'sessions#destroy', as: 'sign_out'
end
