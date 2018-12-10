Rails.application.routes.draw do
  devise_for :admins, path: 'admin'
  devise_for :employees
  

  namespace :admin do
    resources :card_types
    resources :cards
    resources :merchant_category_codes
    resources :employees
    
    root to: "card_types#index"
  end

end
