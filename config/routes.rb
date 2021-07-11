Rails.application.routes.draw do
  root "incidents#index"
  devise_for :users, controllers: { 
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :incidents do 
    collection do
      get 'search'
    end
    resources :articles, only: [:create, :destroy, :edit, :update]
  end 
end
