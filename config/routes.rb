Studium::Application.routes.draw do
  devise_for :users
  
  # Set the root
  root 'home#index'

  # About page
  get '/about', to: 'home#about', as: :about
  
end
