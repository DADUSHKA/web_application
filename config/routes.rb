Rails.application.routes.draw do
  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'sessions' }

  root 'welcome#index'

  resources :tests, only: %i[index start] do
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
    resources :categories, shallow: true, except: :index
    resources :tests, except: %i[start] do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
