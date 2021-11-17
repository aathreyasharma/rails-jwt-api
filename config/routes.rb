Rails.application.routes.draw do
  root to: "login#defaultAction"

  # AuthenticationController
  post 'signup', to: 'login#signup'
  post 'authenticate', to: 'login#authenticate'

  # User Controller
  get 'users/:id', to: 'users#index'
end
