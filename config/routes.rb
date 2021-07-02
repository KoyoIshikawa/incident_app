Rails.application.routes.draw do
  devise_for :users
  root "incidents#index"
  resources :incidents do 
    collection do
      get 'search'
    end
    resources :articles, only: [:create, :destroy, :edit, :update]
  end 
end
