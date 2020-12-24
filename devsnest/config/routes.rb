# frozen_string_literal: true

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
      jsonapi_resources :gbus

      get '/users/:id/gbus', to: 'gbus#showbyuser'
      
    end
  end
end
