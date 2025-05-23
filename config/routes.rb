Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # CREATE
  # where to enter the new task
  get '/tasks/new', to: 'tasks#new', as: :new_task
  # where to send the new task
  post '/tasks', to: 'tasks#create', as: :tasks
  # READ
  get '/tasks', to: 'tasks#index'
  get '/tasks/:id', to: 'tasks#show', as: :task
  # UPDATE
  # get the form
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  # patch to existing task
  patch "/tasks/:id", to: "tasks#update"
  # Defines the root path route ("/")
  # DELETE
  delete "/tasks/:id", to: "tasks#destroy", as: :delete_task
  # root "posts#index"
end
