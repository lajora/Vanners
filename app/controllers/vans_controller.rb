class VansController < ApplicationController
  def index
  end

  def show
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

  private

  def van_params
    params.require(:van).permit(:title, :description, :price, :photo)
  end
end
