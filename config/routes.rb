Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
    get 'validate_login'=>'users#validate_login'

  resources :reservations

  resources :type_rooms

  resources :rooms
end
