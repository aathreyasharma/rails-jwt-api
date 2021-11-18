Rails.application.routes.draw do
  root to: "login#defaultAction"

  # AuthenticationController
  post 'signup', to: 'login#signup'
  post 'authenticate', to: 'login#authenticate'

  # User Controller
  get 'users/:id', to: 'users#index'
  post 'update_infection', to: 'users#update_infection'

  # Test Controller
  post 'test', to: 'tests#new'

  get 'pincode_infection', to: 'pincodes#pincode_infection'

end
