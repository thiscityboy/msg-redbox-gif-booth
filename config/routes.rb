Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :photos, shallow: true do
    member do
      get  :capture
      get  :frame
      post :sms
      get :view
    end
  end

  resources :photo_sets, shallow: true do
    member do
      get :send_photo
      get :done
    end
  end

  root 'photo_sets#index'
end
