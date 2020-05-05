class Api::V1::Private::UtilityController < ApplicationController

    def schedule_generator
        # Invoke the Utility service
        service = UtilityService.new
        errors = []
        required_params = ["season_id", "start_date", "end_date", "day_of_matches"]
        errors = service.required_param(params, required_params)

        if errors.any?
            render json: errors.to_json, status: :unprocessable_entity
            return
        end

        # Get season the generator should run for
        season = Season.find(params[:season_id])

        unless season.schedule_generated 
            # Loop through active divisions and add the active teams to an array. A new inner array for each division
            season.divisions.each do |division|
                if division.active
                    division_teams = []

                    division.teams.each do |team|
                        if team.active
                            division_teams.push(team.id)
                        end
                    end

                    # Run the Seed generator
                    seeds = service.seed(division_teams)

                    # Run the Match Day Generator
                    start_date = Date.parse(params[:start_date])
                    end_date = Date.parse(params[:end_date])
                    day_of_matches = [params[:day_of_matches].to_i]
                    exception_dates = []
                    if params.key?(:exception_dates) && !params[:exception_dates].empty?
                        params[:exception_dates].each do |k, date|
                            exception_dates << Date.parse(date)
                        end
                    end

                    match_days = service.get_schedule_dates(start_date, end_date, day_of_matches, exception_dates)

                    # Run the Match creator
                    matches = service.match_creator(seeds, match_days)
                end
            end

            # Mark the season with the generated flag so it can't be done again
            season.schedule_generated = true
            season.save

            render json: "Success".to_json, status: :created
        else
            render json: "Season already has a schedule".to_json, status: :unprocessable_entity
        end
    end
end
