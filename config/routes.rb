# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create index destroy]
      resources :sessions, only: %i[create]
      resources :projects, only: %i[create index show destroy]
      resources :appointments
    end
  end
end
