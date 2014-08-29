Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

  resources :photos do 
    member do 
      get  :capture
      get  :frame
      post :sms
    end
  end

  root 'photos#index'  
end
