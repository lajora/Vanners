class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @van = Van.find(params[:van_id])
    @booking = Booking.new(booking_params)
    @booking.van = @van
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to confirm_booking_path
    else
      render :new
    end
  end

  def confirmation
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_until)
  end
end
