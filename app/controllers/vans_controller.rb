require 'date'

class VansController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:query].present?
      @vans = policy_scope(Van).near(params[:query],10).geocoded.order(id: :desc)
    else
      @vans = policy_scope(Van).order(id: :desc)
    end
    @date_from = params[:date_from]
    @date_to = params[:date_to]
    if @date_from.present? && @date_to.present?
      @vans = @vans.select { |v| v.available?(@date_from, @date_to) }
    end
    @markers = @vans.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude,
        info_window: render_to_string(partial: "info_window", locals: { van: van }),
        image_url: helpers.asset_url("van-logo-red.png")
      }
    end
  end

  def show
    @van = Van.find(params[:id])
    @date_from = params[:date_from].present? ? Date.strptime(params[:date_from], '%Y-%m-%d') : Date.today()
    @date_to = params[:date_to].present? ?  Date.strptime(params[:date_to], '%Y-%m-%d') : @date_from + 7
    @num_days = (@date_to - @date_from).to_i
    authorize @van
    @active_bookings = @van.bookings.where(status: "pending")
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
    params.require(:van).permit(:title, :description, :price, :address, photos: [])
  end
end
