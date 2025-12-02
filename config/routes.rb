Rails.application.routes.draw do
  devise_for :users
  resources :subscription_services

  get "up" => "rails/health#show", as: :rails_health_check

  root "subscription_services#index"
end
