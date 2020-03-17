# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :registrations

  authenticate :user do
    root 'tasks#index'
    resources :tasks
  end
end
