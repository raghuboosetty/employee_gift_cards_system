Rails.application.routes.draw do
  
  mount GrapeSwaggerRails::Engine, at: "/docs/"
  mount ApplicationApi => "/"

  devise_for :admins, path: 'admin'
  devise_for :employees
  
  namespace :admin do
    resources :card_types
    resources :cards
    resources :merchant_category_codes
    resources :employees
    resources :transactions, only: [:index, :show, :destroy]
    
    root to: "card_types#index"
  end

  resource :employee, only: :show
  resources :transactions, only: [:index, :show]
  
  root to: "home#show"
end
