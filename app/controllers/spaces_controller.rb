class SpacesController < ApplicationController

  def new
    @space = Space.new
  end

  def create
    @space = Space.create(space_params)
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
    @space.update(space_params)
    if @space.save
      redirect_to space_path(@space)
    else
      render :edit
    end
  end

  def show
    @space = Space.find(params[:id])
  end

  def index
    @spaces = Space.all
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to spaces_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :capacity, :price, :booked_by, :meeting_id)
  end
end
