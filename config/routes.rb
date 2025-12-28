Rails.application.routes.draw do
  devise_for :users

  resources :subscription_services do
    get :search, on: :collection
  end

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :admin do
    resources :service_presets
    root "dashboard#index"
  end

  root "subscription_services#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
