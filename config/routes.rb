Rails.application.routes.draw do
  root to: 'pages#home'
  get '/near_me', to: 'pages#near_me', as: "near_me"
  get '/top_places', to: 'pages#top_places', as: "top_places"
  get '/recommended', to: 'pages#recommended', as: "recommended"

  devise_for :users do
  end

  # menu routes
  get '/VamosJuntas', to: 'pages#together', as: :together
  get '/ReportarExperiencia', to: 'pages#report', as: :report
  get '/Comunidade', to: 'pages#community', as: :community
  get '/Empresa', to: 'pages#company', as: :company

  resource :users, only: [:edit, :update, :show]

  resources :angels, except: :index

  # Temporary route for testing - those won/t be nested
  resources :reviews, only: %i[show] do
    resources :responses, only: %i[new create destroy]
  end

  # Temporary route to reviews index - discuss if it should be nested or even exist
  resources :reviews, only: %i[index edit update]
  get 'reviews/:id/disable', to: 'reviews#disable', as: :disable_review
  get 'reviews/:id/satisfy', to: 'reviews#satisfy', as: :satisfy_review
  # patch 'reviews/:id', to: 'reviews#disabled' -> will use update to change

  resources :places, except: %i[destroy show]

  # Temporary route for testing - those will be nested in Places
  resources :places, only: :show do
    resources :reviews, only: %i[new create]
  end
end
