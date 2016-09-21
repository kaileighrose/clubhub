require 'pry'
class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    @team.add_members(params[:team][:members])
    if @team.save
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def join
    @team = Team.find(params[:id])
    @team.members << current_user
    if @team.save
      redirect_to team_path(@team)
    else
      flash[:alert] = "unable to to join team"
      redirect_to team_path(@team)
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    @team.add_members(params[:team][:members])
    if @team.save
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def index
    @teams = Team.where(active: true)
  end

  private

  def team_params
    params.require(:team).permit(:name, :active, :meeting_id, :coach_id, :members => [:id])
  end
end
