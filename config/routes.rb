Rails.application.routes.draw do
  namespace :admin do
    resources :merchant_category_codes
  end
  devise_for :admins, path: 'admin'
  devise_for :employees
  

  namespace :admin do
    resources :card_types
    resources :cards

    root to: "card_types#index"
  end

end
