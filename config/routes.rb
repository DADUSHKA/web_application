Rails.application.routes.draw do

  resources :test do
    resources :questions, shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
