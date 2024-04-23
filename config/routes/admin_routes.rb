Rails.application.routes.draw do
  namespace :dashboard do
    namespace :admin do
      resources :users
      get '/new_user', to: 'registrations#new_user'
      post '/create_user', to: 'registrations#create_user'
    end
  end
end
