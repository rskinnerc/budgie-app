Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "categories#index"
  get 'welcome', to: 'welcome#index', as: 'welcome'
  resources :categories, only: [:index, :show, :new, :create] do
    resources :operations, only: [:new, :create]
  end
end
