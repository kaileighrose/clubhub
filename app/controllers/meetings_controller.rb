class MeetingsController < ApplicationController
  
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.create(meeting_params)
    redirect_to meeting_path(@meeting)
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def index
    @meetings = Meeting.all
  end

  def destroy
    @meeting = Meeting.find(params[:id])
  end

  private

  def meeting_params
    params.require(:meeting).permit(:team_id, :space_id, :time)
  end
end
