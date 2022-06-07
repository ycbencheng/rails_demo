Rails.application.routes.draw do
  get '/signup' => 'user#new'
  post '/users' => 'user#create'

  get '/' => 'user#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
