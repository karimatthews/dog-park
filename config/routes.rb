Rails.application.routes.draw do

  root to: 'pages#main'
  post "/parks/:id/add_dog", to: 'parks#add_dog'

  resources :parks
  resources :dogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
