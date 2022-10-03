Rails.application.routes.draw do
  root to: "home#homepage"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get '/s/:slug', to: 'links#show', as: :short
  resources :links, except: [:show]
end
