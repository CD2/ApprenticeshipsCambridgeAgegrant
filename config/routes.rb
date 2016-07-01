Rails.application.routes.draw do
 
  resource :grant_details, only: [:new, :create], path: 'age-grant', path_names: {new: '/'}
  get '/:id', to: 'pages#show', as: :page
  root 'pages#show' 

end
