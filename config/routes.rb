Rails.application.routes.draw do
  resources :address
  get '/', to: "home#homepage"
end
