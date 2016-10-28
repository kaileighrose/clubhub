require 'pry'
class NotesController < ApplicationController
  def new
    @note = Note.new
    @meeting_id = params[:meeting_id]
  end

  def create
    @note = Note.create(note_params)
    if @note.save
      render json: @note 
      redirect_to team_meeting_path(@note.meeting.team, @note.meeting)
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
    if @note.author_id == current_user.id
      @meeting_id = params[:meeting_id]
    else
      flash[:error] = "Can Only Edit Your Own Notes"
      redirect_to team_meeting_path(@note.meeting.team, @note.meeting)
    end
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to team_meeting_path(@note.meeting.team, @note.meeting)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.author_id == current_user.id
      @meeting = Meeting.find(@note.meeting_id)
      @team = @meeting.team
      @note.destroy
      redirect_to team_meeting_path(@team, @meeting)
    else
      flash[:error] = "Can Only Delete Your Own Notes"
      redirect_to team_meeting_path(@note.meeting.team, @note.meeting)
    end
    
  def show
    @note = Note.find(params[:id])
    render json: @note
  end

  end

  private

  def note_params
    params.require(:note).permit(:author_id, :meeting_id, :content)
  end
end
