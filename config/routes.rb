Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  mount Sidekiq::Web => '/sidekiq'
  root "articles#index"

  resources :articles do
    resources :comments
  end
end
