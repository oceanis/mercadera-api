Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/madmin', as: 'rails_admin'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :locations
      resources :categories
      resources :subcategories
      resources :listings do
        collection do
          get 'new_s3_upload'
        end

        member do
          post 'picture'
        end
      end
    end
  end
end
