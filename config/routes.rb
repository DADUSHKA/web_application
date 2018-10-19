Rails.application.routes.draw do
  root 'about#about'
  # get 'about/about'
  get 'about/author'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
