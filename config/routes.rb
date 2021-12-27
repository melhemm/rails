Rails.application.routes.draw do

  root to: "tests#index"

  devise_for :users, path: :gurus, path_name: {sigin_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end 
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, except: :index, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index 
  end
end
