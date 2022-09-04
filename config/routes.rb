Rails.application.routes.draw do
  devise_for :users

  root 'spendings#index'

  namespace :spendings do
    resource :destroyes
  end
  resources :spendings
end
