class Api::V1::Public::MembersController < ApplicationController

  # GET api/v1/public/members/deceased
  def deceased
    @members = Member.where(deceased: true)

    render json: @members, include: ['members']
  end

end
