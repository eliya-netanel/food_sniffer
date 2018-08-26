Rails.application.routes.draw do
  devise_for :users
  root to:  'pages#home'#new_user_session_path

  get :diet, to: 'diets#show', as: :user_diet
  resources :diets, only: [:new, :create, :edit, :update]
  resources :scans, only: [:index, :new, :create, :show] do
    collection do
      post :get_product
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
