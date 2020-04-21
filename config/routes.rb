Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :sponsors do
        get 'active', on: :collection
      end

      resources :member_services do
        get 'active', on: :collection
      end

      resources :fields do
        get 'active', on: :collection
      end

      resources :constitution_articles do
        get 'active', on: :collection
      end

      resources :constitution_by_laws do
        get 'active', on: :collection
      end

      resources :seasons do
        collection do
          get 'active'
          get 'active_with_divisions'
          get 'active_with_divisions_teams'
        end
      end

      resources :divisions do
        collection do
          get 'active'
        end

        member do
          get 'with_teams'
          get 'with_teams_full'
        end
      end

      resources :teams do
        collection do
          get 'active'
        end

        member do
          get 'full'
        end
      end

      resources :members do
        collection do
          get 'active'
          get 'deceased'
        end
      end

      # Utiliy Routes
      get '/utility/season_menu', to: 'utility#season_menu'
      resources :team_members
      resources :referral_methods
    end
  end
end
