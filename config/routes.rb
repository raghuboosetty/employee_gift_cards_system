require 'sidekiq/web'
Rails.application.routes.draw do
  
  mount GrapeSwaggerRails::Engine, at: "/docs/"
  mount ApplicationApi => "/"

  mount Sidekiq::Web, at: "/sidekiq"

  devise_for :admins, path: 'admin'
  devise_for :employees
  
  namespace :admin do
    resources :card_types
    resources :cards
    resources :merchant_category_codes
    resources :employees do
      resources :transactions, only: [:index, :show, :destroy]
    end
    resources :transactions, only: [:index, :show, :destroy] do
      collection do
        get :export
      end
    end
    
    root to: "card_types#index"
  end

  resource :employee, only: :show
  resources :transactions, only: [:index, :show]

  get 'download_report' => "home#download_report", as: :download_report
  
  root to: "home#show"
end
