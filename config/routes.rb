Rails.application.routes.draw do
  root 'todo_lists#index'

  resources :todo_lists do
    resources :todo_tasks
  end

  match ':controller(/:action(/:id))', :via => [:get, :post]
  resources :users

end
