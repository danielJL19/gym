Rails.application.routes.draw do
  namespace :dashboard do
    namespace :admin do
      resources :users
      get '/new_user', to: 'registrations#new_user'
      post '/create_user', to: 'registrations#create_user'

      get '/user_membership_payment/:id', to: 'membership_payments#index', as: :membership_payments
    end
  end
end
