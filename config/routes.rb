Rails.application.routes.draw do

  get 'todos/index'
  get 'users/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :tasks do
    resources :todos
  end

  root to: 'todos#index'
  get 'todos/:id/complete', to: 'todos#complete', as: 'complete'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
