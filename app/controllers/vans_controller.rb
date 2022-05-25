class VansController < ApplicationController
  def index
    @vans = Van.all
    @markers = @vans.geocoded.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude,
        info_window: render_to_string(partial: "info_window", locals: { van: van }),
        image_url: helpers.asset_url("van-logo-red.png")
      }
    end
    @cards_view = false
  end

  def show
    @van = Van.find(params[:id])
    @booking = Booking.new()
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
