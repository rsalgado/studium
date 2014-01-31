Studium::Application.routes.draw do
  devise_for :users
  
  # Set the root
  root 'home#index'

  # About page
  get '/about', to: 'home#about', as: :about

  # Readings resource
  resources :readings, except: [:new, :show], shallow: true   do
    # Redirect to Sections#index instead of Reading#show (which is not valid)
    get '/:reading_id/', to: 'sections#index', on: :collection
    
    # Sections resource
    resources :sections, except: [:show], shallow: true do
      # Render sections#notes instead of sections#show (which is not valid)
      get '/', to: 'sections#notes', on: :member
      # Add route to section#notes
      get '/notes', to: 'sections#notes', on: :member
    end

  end
end
