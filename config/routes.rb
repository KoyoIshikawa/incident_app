Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  root "incidents#index"
  resources :incidents do 
    collection do
      get 'search'
    end
    resources :articles, only: [:create, :destroy, :edit, :update]
  end 
end
