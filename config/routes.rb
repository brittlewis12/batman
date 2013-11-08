Beatcove::Application.routes.draw do
  resources :songs, only: [:index]
end
