require 'pry'
class UsersController < ApplicationController

  def home
    if current_user == nil
      render "home"
    else
      redirect_to user_path(current_user)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id]) if params[:id] != nil
    @meetings = @user.meetings.where("time > ?", Time.now)
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
