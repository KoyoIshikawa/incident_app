Rails.application.routes.draw do
  devise_for :users
  root "incidents#index"
end
