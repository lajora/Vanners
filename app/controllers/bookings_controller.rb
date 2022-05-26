class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
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

  def accept
    booking = Booking.find(params[:booking_id])
    booking.status = "accepted"
    booking.save!
    redirect_to bookings_path
  end

  def reject
    booking = Booking.find(params[:booking_id])
    booking.status = "rejected"
    booking.save!
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_until)
  end
end
