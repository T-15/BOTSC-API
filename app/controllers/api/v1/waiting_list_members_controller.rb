class WaitingListMembersController < ApplicationController
  before_action :set_waiting_list_member, only: [:show, :update, :destroy]

  # GET /waiting_list_members
  def index
    @waiting_list_members = WaitingListMember.all

    render json: @waiting_list_members
  end

  # GET /waiting_list_members/1
  def show
    render json: @waiting_list_member
  end

  # POST /waiting_list_members
  def create
    @waiting_list_member = WaitingListMember.new(waiting_list_member_params)

    if @waiting_list_member.save
      render json: @waiting_list_member, status: :created, location: @waiting_list_member
    else
      render json: @waiting_list_member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /waiting_list_members/1
  def update
    if @waiting_list_member.update(waiting_list_member_params)
      render json: @waiting_list_member
    else
      render json: @waiting_list_member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /waiting_list_members/1
  def destroy
    @waiting_list_member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waiting_list_member
      @waiting_list_member = WaitingListMember.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def waiting_list_member_params
      params.require(:waiting_list_member).permit(:waiting_list_id, :member_id)
    end
end
