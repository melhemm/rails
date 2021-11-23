Rails.application.routes.draw do
  resources :questions, only: [:index, :show, :new, :create, :destroy]

  root to: "questions#index"

  resources :tests do
    resources :questions, shallow: true
  end
  
end
