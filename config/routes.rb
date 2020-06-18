Rails.application.routes.draw do

    resources :sessions, only: %i[create]


  resources :users, only: %i[create index]
  

  namespace :v1 do
    resources :projects, only: %i[create index show]
  end

  # namespace :v1 do
  #   resources :appointments
  # end

end
