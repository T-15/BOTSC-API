Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :private do

        resources :constitution_articles
        resources :constitution_by_laws
        resources :divisions do
          collection do
            post 'create_with_waiting_list'
          end
        end
        resources :fields
        resources :matches
        resources :members do
          collection do
            get 'active'
          end
        end
        resources :member_services
        resources :positions
        resources :referral_methods
        resources :sponsors
        resources :seasons
        resources :teams
        resources :team_members
        resources :waiting_lists
        post '/utility/schedule_generator', to: 'utility#schedule_generator'
        
      end

      namespace :public do

        # Get Methods
        get '/constitution_articles/active', to: 'constitution_articles#active'
        get '/constitution_by_laws/active', to: 'constitution_by_laws#active'
        get '/divisions/active', to: 'divisions#active'
        get '/divisions/:id/with_teams', to: 'divisions#with_teams', as: 'division_with_teams'
        get '/divisions/:id/with_teams_full', to: 'divisions#with_teams_full', as: 'division_with_teams_full'
        get '/fields/active', to: 'fields#active'
        get '/matches/for_team', to: 'matches#for_team'
        get '/matches/:id/full', to: 'matches#full', as: 'matches_full'
        get '/members/deceased', to: 'members#deceased'
        get '/member_services/active', to: 'member_services#active'
        get '/positions/active', to: 'positions#active'
        get '/referral_methods', to: 'referral_methods#index'
        get '/sponsors/active', to: 'sponsors#active'
        get '/seasons/active', to: 'seasons#active'
        get '/seasons/active_with_divisions', to: 'seasons#active_with_divisions'
        get '/seasons/active_with_divisions_teams', to: 'seasons#active_with_divisions_teams'
        get '/teams/active', to: 'teams#active'
        get '/teams/:id/full', to: 'teams#full', as: 'teams_full'
        get '/utility/season_menu', to: 'utility#season_menu'
        
        # Post methods
        post '/utility/application', to: 'utility#application'

      end
    end
  end
end
