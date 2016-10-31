Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user_sessions, only: [] do
    collection do
      post :login
      delete :logout
    end
  end
end
