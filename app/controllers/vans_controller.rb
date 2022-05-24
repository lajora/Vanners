class VansController < ApplicationController
  def index
  end

  def show
    @van = Van.find(params[:id])
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    @van.user = current_user
    if @van.save!
      redirect_to van_path(@van)
    end
  end

  def edit
    @van = Van.find(params[:id])
  end

  def update
    @van = Van.find(params[:id])
    @van.update(van_params)
    redirect_to van_path(@van)
  end

  private

  def van_params
    params.require(:van).permit(:title, :description, :price, :photo)
  end
end
