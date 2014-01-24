Studium::Application.routes.draw do
  devise_for :users
  # Set the root
  root 'home#index'

  
end
