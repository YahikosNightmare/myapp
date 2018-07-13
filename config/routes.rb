Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  get 'welcome/index'

  #root :to => "welcome#index"
  root to: "home#index"

  resources :images

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
