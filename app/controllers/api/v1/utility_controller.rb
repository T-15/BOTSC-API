class Api::V1::UtilityController < ApplicationController

    # GET /api/v1/utility/season_menu
    def season_menu
        season = Season.find_by(active: true)

        render json: season,
        include: 'divisions.teams'
    end
end
