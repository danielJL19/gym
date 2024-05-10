Rails.application.routes.draw do
  namespace :dashboard do
    namespace :shared do
      resources :transactions, only: %i[create index] do
        post :create_transbank, on: :collection
        get :execute_transbank, on: :collection
      end
    end
  end
end
