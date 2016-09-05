require 'pry'
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create
  end

  def show
    @user = User.find(current_user.id) if current_user != nil
  end
end
