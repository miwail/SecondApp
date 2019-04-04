Rails.application.routes.draw do
  resources :users do
    resources :tasks
  end

    resources :profiles, only: [:new, :create, :show, :edit, :update]

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'signup'     => 'users#new'

  root to: 'home_page#home'
end
