Rails.application.routes.draw do
 
  resources :grant_reviews
  resource :grant_details, only: [:new, :create], path: 'age-grant', path_names: {new: '/'}

  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get '/complete_application', to: 'pages#complete_application'

  namespace :admin do
    resources :grant_details, only: [:index, :show, :destroy]
  end

  get '/:id', to: 'pages#show', as: :page

  root 'pages#home'

end
