class MeetingsController < ApplicationController
  
  def new
    @meeting = Meeting.new
    @team = Team.find(params[:team_id])
  end

  def create
    @meeting = Meeting.create(meeting_params)
    @meeting.team = Team.find(params[:team_id])
    if @meeting.save
      redirect_to team_meeting_path(@meeting.team, @meeting)
    else
      render :new
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def availablespaces
    @meeting = Meeting.find(params[:id])
    @spaces = Space.available_spaces(@meeting.time)
    redirect_to 'space'
  end

  def addspace
    @meeting = Meeting.find(params[:id])
    redirect_to team_meeting_path(@meeting)
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update
      redirect_to team_meeting_path(@meeting.team, @meeting)
    else
      render :edit
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def index
    @team = Team.find(params[:team_id])
    @meetings = @team.meetings
  end

  def destroy
    @meeting = Meeting.find(params[:id]) 
    @meeting.destroy
    redirect_to team_meetings_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:team_id, :space_id, :time)
  end
end
