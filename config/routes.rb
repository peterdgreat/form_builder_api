Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      get 'forms/:slug', to: 'public_forms#show', as: 'public_form'
      post 'forms/:slug/submit', to: 'public_forms#submit', as: 'submit_public_form'
      resources :forms do
        resources :form_fields, only: [:create, :update, :destroy]
        resources :form_submissions, only: [:create, :index]
      end
    end
  end


  # Defines the root path route ("/")
  # root "posts#index"
end
