Rails.application.routes.draw do
  root 'todo_lists#index'

  get 'login' => 'users#login', :as => 'login'
  post 'login' => 'users#attempt_login', :as => 'create_user'
  get 'logout' => 'users#logout', :as => 'logout'

  resources :todo_lists do
    resources :todo_tasks
  end

  resources :users

end
