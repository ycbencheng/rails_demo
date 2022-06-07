Rails.application.routes.draw do
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  get '/signup' => 'user#new'
  post '/signup' => 'user#create'

  get '/account' => 'user#edit'
  patch '/account' => 'user#update'
  put '/account' => 'user#update'
  delete '/account/destroy' => 'user#destroy'

  root 'user#new'
end
