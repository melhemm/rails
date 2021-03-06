Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_name: { sigin_in: :login, sign_out: :logout }

  resources :users do
    resources :feedbacks, only: %i[new create]
  end

  resources :badges, only: :index

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    resources :gists, only: :create
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, except: :index, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges
  end
end
