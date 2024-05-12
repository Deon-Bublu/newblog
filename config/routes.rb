# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resource :session, only: %i[new create destroy]

    resources :users, only: %i[new create edit update]

    resources :questions do
      resources :answers, only: %i[create destroy edit update]
    end

    namespace :admin do
      resources :users, only: %i[index]
    end
    #  , only: %i[index new edit create update destroy show]

    root 'pages#index'
  end
end
