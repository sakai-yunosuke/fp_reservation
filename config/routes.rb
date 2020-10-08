Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'

  resources :users, only: %i(new create show edit update)
  resources :sessions, only: %i(new create destroy)
  resources :schedules, only: %i(index new create destroy)
  resources :reservations, only: %i(create destroy)
end
