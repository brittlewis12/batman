Beatcove::Application.routes.draw do
  resources :songs, only: [:index]
  resources :users, 
  resources :tracks, 
end
