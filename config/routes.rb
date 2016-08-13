Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/create'

  root to: 'restaurants#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
