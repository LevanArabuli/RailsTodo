Rails.application.routes.draw do
  resources :todos
   root 'welcome#index'
end
