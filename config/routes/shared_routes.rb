Rails.application.routes.draw do
  namespace :dashboard do
    namespace :shared do
      resources :transactions, only: %i[create index] do
        post :create_transbank, on: :collection
        get :execute_transbank, on: :collection
        get :response_transbank, on: :member
      end
    end
  end
end
