Rails.application.routes.draw do
  devise_for :admins, path: 'admin'
  devise_for :employees
  

  namespace :admin do
    resources :card_types
    resources :cards
  end

end
