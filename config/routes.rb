Rails.application.routes.draw do
  namespace :v1 do
    post :auth, to: "authentication#create"
    resources :users  

  end

 

  namespace :v1 do
    resources :projects
  end

  namespace :v1 do
    resources :appointments
  end

end
