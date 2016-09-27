class MeetingsController < ApplicationController
  
  def new
    @team = Team.find(params[:team_id])
    if current_user == nil || @team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to Add a Meeting"
      redirect_to root_path
    else
      @path = team_meetings_path
      @meeting = Meeting.new
      @meeting.notes.build
    end
  end

  def create
    @team = Team.find(params[:team_id])
    if current_user == nil || @team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to Add a Meeting"
      redirect_to root_path
    else
      @meeting = Meeting.create(meeting_params)
      @meeting.team = Team.find(params[:team_id])
      if @meeting.notes != nil
        @meeting.notes.each do |n|
          n.meeting_id = @meeting.id
          n.save
        end
      end
      if @meeting.save
        redirect_to team_meetings_path(@meeting.team, @meeting)
      else
        @path = team_meetings_path
        render :new
      end
    end
  end

  def edit
    @team = Team.find(params[:team_id])
    if current_user == nil || @team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to Edit a Meeting"
      redirect_to root_path
    else
      @meeting = Meeting.find(params[:id])
      @path = team_meeting_path(@team, @meeting)
      @meeting.notes.build
    end
  end

  def update
    @meeting = Meeting.find(params[:id])
    if current_user == nil || @meeting.team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to Edit a Meeting"
      redirect_to root_path
    else
      @meeting = Meeting.find(params[:id])
      @meeting.update(meeting_params)
      if @meeting.save
        redirect_to team_meeting_path(@meeting.team, @meeting)
      else
        render :edit
      end
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
    if current_user == nil || @meeting.team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to See Meetings"
      redirect_to root_path
    end
  end

  def index
    @team = Team.find(params[:team_id])
    if current_user == nil || @team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to See Meetings"
      redirect_to root_path
    else
      @meetings = @team.meetings
      redirect_to team_path(@team)
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id]) 
    if current_user == nil || @meeting.team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to Delete Meetings"
      redirect_to root_path
    else
      @meeting.destroy
      redirect_to team_path
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:team_id, :space_id, :time, :location, :notes_attributes => [:content, :author_id])
  end
end
