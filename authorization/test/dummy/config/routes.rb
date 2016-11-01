Rails.application.routes.draw do
  namespace :admin do
    resources :articles, only: [:index, :show]
  end
end
