Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, defaults: { format: :json }

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      get 'forms/:slug', to: 'public_forms#show', as: 'public_form'
      post 'forms/:slug/submit', to: 'public_forms#submit', as: 'submit_public_form'
      resources :form_fields, only: [:create, :update, :destroy, :index]
      resources :forms do
        resources :form_fields, only: [:create, :update, :destroy, :index]
        resources :form_submissions, only: [:create, :index]
      end
    end
  end

  # Defines the root path route ("/")
  root to: proc { [200, {}, ['API Root']] }
end
