require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "home#index"

  mount API => '/'
  mount Sidekiq::Web => '/sidekiq'
  root to: "admin/keypads#new"
end
