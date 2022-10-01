Rails.application.routes.draw do
  devise_for :users
  resources :address
  get '/', to: "home#homepage"
end
