Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
       sign_in: 'login',
       sign_out: 'logout',
       registration: 'signup'
    },
    controllers: {
       sessions: 'sessions',
       registrations: 'registrations'
    }

  namespace :api do
    namespace :v1 do
      jsonapi_resources :users
      jsonapi_resources :mmts
      jsonapi_resources :mentor_feeds
      jsonapi_resources :mentee_feeds
    end
  end
end