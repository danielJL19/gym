Rails.application.routes.draw do
  namespace :dashboard do
    namespace :admin do
      resources :users
    end
  end
end
