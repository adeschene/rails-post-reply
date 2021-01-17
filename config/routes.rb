Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
  	resources :replies
  end
end
