class SpacesController < ApplicationController

  def new
    @space = Space.new
  end

  def create
    @space = Space.create(space_params)
    redirect_to space_path(@space)
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
  end

  def show
    @space = Space.find(params[:id])
  end

  def index
    @spaces = Space.all
  end

  def destroy
    @space = Space.find(params[:id])
  end

  private

  def space_params
    params.require(:space).permit(:name, :capacity, :price, :booked_by, :meeting_id)
  end
end
