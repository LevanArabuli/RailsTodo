Rails.application.routes.draw do
  get 'accounts/login'
  post 'accounts/login', to: 'accounts#login_post'

  get 'accounts/register'
  post 'accounts/register', to: 'accounts#register_post'

  resources :todos
  root 'todos#index'

  post 'todos/updatestatus', to: 'todos#update_status'
end
