Rails.application.routes.draw do
 
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create index]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :projects, only: %i[create index show]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :appointments, only: %i[index create show destroy]
    end
  end
end
