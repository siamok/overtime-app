# frozen_string_literal: true

Rails.application.routes.draw do
  resources :audit_logs
  namespace :admin do
    resources :users
    resources :admin_users
    resources :posts

    root to: 'users#index'
  end
  resources :posts
  devise_for :users, skip: [:registrations]
  root 'static#homepage'
end
