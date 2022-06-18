Rails.application.routes.draw do
  get 'items/index'
  post 'items/create'
  put 'items/update'
  delete 'items/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
