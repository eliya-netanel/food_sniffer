Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # root to: new_user_session_path

  # get "pages/home", as: ""
  root to:  'pages#home' #new_user_session_path
  get :diet, to: 'diets#show', as: :user_diet
  resources :diets, only: [:new, :create, :edit, :update, :show]
  resources :scans, only: [:index, :new, :create, :show, :edit, :update] do
    collection do
      post :get_product
    end
  end

  # %w( 404 500 ).each do |code|
  #   get code, :to => "errors#show", :code => code
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
