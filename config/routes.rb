Rails.application.routes.draw do
  root to: "home#homepage"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :address
end
