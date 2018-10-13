Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      jsonapi_resources :apps do
        jsonapi_resources :components do
        end
      end
      jsonapi_resources :component_types, path: "compoent-types"  do
      end
      resources :docs, only: [:index]
    end
  end
end
