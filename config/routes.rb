Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/create'

  resources 'pages'

  resources 'restaurants' do
    resources 'reviews', except: [:show, :index]
    collection do
      get 'search'
    end
  end

  get 'about' => 'pages#about'

  get 'contact' => 'pages#contact'

  root to: 'restaurants#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
