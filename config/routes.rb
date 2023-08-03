Rails.application.routes.draw do

  root 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'recipes/card_update', to: 'recipes#card_update'
  post 'recipes/form_add', to: 'recipes#form_add'
  post 'recipes/destroy_form', to: 'recipes#destroy_form'

  resources :recipes, only: %i[index new create] do
    resources :recipe_materials, only: %i[new create]
    resources :recipe_products, only: %i[new create]
  end
  resources :machines, only: %i[new create]
  resources :items, only: %i[new create]

end
