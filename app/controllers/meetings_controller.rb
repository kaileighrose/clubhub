require "pry"
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
      @meeting.team_name = @team.name
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
        @meeting.notes.build
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
      @note_id = @meeting.notes.first.id
    end
  end

  def update
    @team = Team.find(params[:team_id])
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
        @path = team_meeting_path(@team, @meeting)
        render :edit
      end
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
    @team = Team.find(params[:team_id])
    @meeting.team_name = @team.name
    @note = Note.new
    if current_user == nil || @meeting.team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to See Meetings"
      redirect_to root_path
    end
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @meeting }
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
      @team = @meeting.team
      @meeting.destroy
      redirect_to team_path(@team)
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:team_id, :time, :location, :notes_attributes => [:content, :author_id, :id])
  end
end
