require 'pry'
class TeamsController < ApplicationController
  def new
    @team = Team.new
    5.times do
      @team.members.build
    end
  end

  def create
    @team = Team.create!(team_params)
    #@team.members << User.find_or_create_by(name: params[:user][:name])
    if @team.save
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    binding.pry
    @team = Team.find(params[:id])
    @team.update(team_params)
    #@team.members << User.find_or_create_by(name: params[:user][:name])
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
    #add scope to make it only active teams
    @teams = Team.where(active: true)
  end

  private

  def team_params
    params.require(:team).permit(:name, :active, :meeting_id, :coach_id, :user => [:name], :members_attributes => [:name], :members => [])
  end
end
