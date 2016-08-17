Rails.application.routes.draw do

  get '/security', to: 'pages#security'
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


  get '/i-have-already-applied-for-a-grant-and-need-to-upload-evidence-to-claim', to: 'grant_reviews#edit', as: :edit_grant_review
  patch '/i-have-already-applied-for-a-grant-and-need-to-upload-evidence-to-claim', to: 'grant_reviews#update', as: :grant_review


  namespace :admin do
    root :to => redirect('/admin/grant_details')
    get '/login', to: 'sessions#new', as: :login
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy', as: :logout

    resources :training_providers, except: [:show] do
      resources :grant_details, only: :index
    end
    get '/search', to: 'grant_details#search'
    resources :users, except: [:show]
    resources :grant_details, only: [:index, :show, :edit, :update, :destroy] do
      member do
        get 'send_no_training'
        get 'approve'
      end
      get 'download-evidence/:gid', action: :download_evidence, as: :download_evidence, on: :member
      get 'download-pro-forma', action: :download_pro_forma_invoice, on: :member
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
