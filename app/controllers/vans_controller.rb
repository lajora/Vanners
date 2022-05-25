class VansController < ApplicationController
  def index
    @vans = policy_scope(Van)
  end

  def show
    @van = Van.find(params[:id])
    authorize @van
    @booking = Booking.new
    authorize @booking
  end

  def new
    @van = Van.new
    authorize @van
  end

  def create
    @van = Van.new(van_params)
    authorize @van
    @van.user = current_user
    if @van.save!
      redirect_to van_path(@van)
    end
  end

  def edit
    @van = Van.find(params[:id])
    authorize @van
  end

  def update
    @van = Van.find(params[:id])
    authorize @van
    @van.update(van_params)
    redirect_to van_path(@van)
  end

  def destroy
    @van = Van.find(params[:id])
    @van.destroy

    redirect_to vans_path
  end

  private

  def van_params
    params.require(:van).permit(:title, :description, :price, :photo)
  end
end
