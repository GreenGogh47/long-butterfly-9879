Rails.application.routes.draw do
  resources :mechanics, only: [:show]
  post "/mechanics/:id/mechanic_rides", to: "mechanic_rides#create"
end
