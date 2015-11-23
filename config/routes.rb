Rails.application.routes.draw do
  resources :menus

  get 'static_pages/home'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'static_pages#home'

end
