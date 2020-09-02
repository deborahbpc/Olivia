Rails.application.routes.draw do
  root to: 'places#index'
  get '/home', to: 'pages#home'
  devise_for :users do
  end

  resource :users, only: :show

  resources :angels, only: %i[new create show edit update destroy index]

  # Temporary route for testing - those will be nested in Places
  resources :reviews, only: %i[index new]
  # Temporary route for testing - those won/t be nested
  resources :reviews, only: %i[show] do
    resources :responses, only: %i[new create destroy]
  end

  resources :places, except: :destroy
end
