Beatcove::Application.routes.draw do

  root 'welcome#index'

  resource :session, only: [:new, :create, :destroy]

  resources :users, except: [:index]

  resources :songs, except: [:index]
  
  resources :tracks, only: [:new, :create, :destroy, :update, :show]

end
