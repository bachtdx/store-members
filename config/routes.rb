Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication_user#authenticate'
  post 'signup', to: 'users#create'
  post 'auth/login-admin', to: 'authentication_admin#authenticate'
  get 'list-users', to: 'administrators#list_all_user'
  put 'edit-user', to: 'administrators#edit_user'
  delete 'delete-user', to: 'administrators#delete_user'
  get 'search-user', to: 'administrators#search_user'
end
