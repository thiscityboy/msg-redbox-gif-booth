Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :stops do
    resources :photos, shallow: true do
      member do
        get  :capture
        get  :frame
        post :sms
        get :view
      end
    end
  end

  root 'stops#index'
end
