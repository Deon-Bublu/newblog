Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: %i[create destroy edit update]
  end


  #  , only: %i[index new edit create update destroy show]

  root 'pages#index'
end
