Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]

  resources :users, only: %i[new create edit update]

  resources :questions do
    resources :answers, only: %i[create destroy edit update]
  end


  #  , only: %i[index new edit create update destroy show]

  root 'pages#index'
end
