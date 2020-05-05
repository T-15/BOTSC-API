class Api::V1::Public::SeasonsController < ApplicationController

  # GET api/v1/public/seasons/active
  def active
    @season = Season.find_by(active: true)

    render json: @season, include: ['seasons']
  end

  # GET api/v1/public/seasons/active_with_divisions
  def active_with_divisions
    @season = Season.find_by(active: true)

    render json: @season, include: ['seasons', 'divisions']
  end

  # GET api/v1/public/seasons/active_with_divisions_teams
  def active_with_divisions_teams
    @season = Season.find_by(active: true)

    render json: @season, include: ['seasons', 'divisions', 'divisions.teams', 'divisions.teams.convenor']
  end

end
