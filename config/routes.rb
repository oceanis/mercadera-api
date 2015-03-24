Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :locations
      resources :categories
      resources :subcategories
      resources :listings
    end
  end

  root 'listings#latest'
end
