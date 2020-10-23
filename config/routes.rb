Rails.application.routes.draw do
  get 'user/index'
  post 'user/create'
  root 'user#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
