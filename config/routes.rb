Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  namespace :account do
    resource :password, only: [ :edit, :update ]
    get "cancel" => "cancels#index"
  end

  resources :subscription_services do
    get :search, on: :collection
  end

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :admin do
    resources :service_presets
    root "dashboard#index"
  end

  root "home#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
