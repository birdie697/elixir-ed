Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'

  resources :homes, only: [:index]
  resources :educations, only: [:index]
  resources :calculations, only: [:index]
  resources :credits, only: [:index]

end
