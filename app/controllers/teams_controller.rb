class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
  end

  def show
    @team = Team.find(params[:id])
  end

  def index
    #add scope to make it only active teams
    @teams = Team.all
  end

  private

  def team_params
    params.require(:team).permit(:name, :active, :meeting_id, :coach_id, :members => [])
  end
end
