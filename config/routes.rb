Rails.application.routes.draw do
  root 'welcome#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :sessions, only: %i[create destroy]
  resources :users, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
