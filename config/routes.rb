Rails.application.routes.draw do
  root to: "lists#index"
  resources :bookmarks, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :show, :new, :create,] do
    resources :bookmarks, only: [:new, :create]
  end
end
