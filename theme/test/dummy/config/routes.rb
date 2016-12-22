Rails.application.routes.draw do
  namespace :admin do
    resources :articles
    get 'login', to: 'main#login', as: 'main_login'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
