Rails.application.routes.draw do
 
  resource :grant_details, only: [:new, :create], path: 'age-grant', path_names: {new: '/'}

  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get '/application_pending', to: 'pages#application_pending'
  get '/complete_application', to: 'pages#complete_application'


  get '/check_if_emails_need_to_go_out_to_people_who_registered_10_weeks_ago', to: 'pages#email_10_weeks_ago'

  get '/apply', to: 'grant_details#new'

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  get '/i-have-already-applied-for-a-grant-and-need-to-upload-evidence-to-claim', to: 'grant_reviews#new', as: :new_grant_review
  post '/i-have-already-applied-for-a-grant-and-need-to-upload-evidence-to-claim', to: 'grant_reviews#create', as: :grant_reviews

  namespace :admin do
    root :to => redirect('/admin/grant_details')
    get '/login', to: 'sessions#new', as: :login
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy', as: :logout

    resources :training_providers, except: [:show]
    resources :grant_details, only: [:index, :show, :destroy] do
      get 'download-evidence', as: :download_evidence, on: :member
    end
  end

  resources :pages, only: :show, path: ''
  root to: 'pages#home'

end



'/do-i-qualify'
'/how-much-funding-is-available'
'/what-do-i-need-to-do-to-claim'
'/ive-already-applied-once-can-i-claim-again'
'/how-quickly-will-i-receive-the-money'
'/i-have-already-applied-for-a-grant-and-need-to-upload-evidence-to-claim'