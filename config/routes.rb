Rails.application.routes.draw do
  devise_for :users
  resources :messages
  get 'messages/all/:user_id', to: 'messages#all', as: :all_messages
  root to: 'messages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
