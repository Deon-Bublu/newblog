Rails.application.routes.draw do
  get '/questions', to: 'questions#index'
  get 'pages/index'
  root 'pages#index'
end
