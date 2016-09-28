require 'pry'
class TeamsController < ApplicationController
  def new
    if current_user != nil
      @team = Team.new
    else
      redirect_to root_path
    end
  end

  def create
    if current_user != nil
      @team = Team.create(team_params)
      @team.add_members(params[:team][:members])
      if @team.save
        redirect_to team_path(@team)
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def join
    if current_user != nil
      @team = Team.find(params[:id])
      @team.members << current_user
      if @team.save
        redirect_to team_path(@team)
      else
        flash[:alert] = "unable to to join team"
        redirect_to team_path(@team)
      end
    else
      redirect_to root_path
    end
  end

  def edit
    @team = Team.find(params[:id])
    if current_user == nil || @team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to Edit"
      redirect_to root_path
    end
  end

  def update
    @team = Team.find(params[:id])
    if current_user == nil || @team.members.include?(current_user) != true
      flash[:error] = "Must Be a Team Member to Edit"
      redirect_to root_path
    else
      @team.update(team_params)
      @team.add_members(params[:team][:members])
      if @team.save
        redirect_to team_path(@team)
      else
        render :edit
      end
    end
  end

  def show
    if current_user != nil
      (params[:team_id] == nil) ? @team = Team.find(params[:id]) : @team = Team.find(params[:team_id])    
    else
      redirect_to root_path
    end
  end

  def index
    if current_user != nil
      @teams = Team.where(active: true)
    else
      redirect_to root_path
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :active, :meeting_id, :coach_id, :members => [:id])
  end
end
