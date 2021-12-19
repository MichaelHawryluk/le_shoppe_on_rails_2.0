Rails.application.routes.draw do
  resources :pages, except: [:show]
  get '/pages/:permalink' => 'pages#permalink', as: "permalink"
  get '/search', to: 'search#index'
  resources :products
  resources :search
  resources :abouts, only: %i[index new edit ]
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
