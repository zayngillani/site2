Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "clients#index"
  resources :clients do
    get :export_csv, on: :collection
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
