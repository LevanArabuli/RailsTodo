Rails.application.routes.draw do
  resources :todos
  root 'todos#index'

  post 'todos/updatestatus', to: 'todos#update_status'
end
