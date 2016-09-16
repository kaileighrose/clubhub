require 'pry'
class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    binding.pry
    if @note.save
      redirect_to team_meating_path(@note.meeting.team, @note.meeting)
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to team_meating_path(@note.meeting.team, @note.meeting)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @meeting = Meeting.find(@note.meeting_id)
    @team = @meeting.team
    @note.destroy
    redirect_to team_meating_path(@team, @meeting)
  end
  private

  def note_params
    params.require(:note).permit(:author_id, :meeting_id, :content)
  end
end
