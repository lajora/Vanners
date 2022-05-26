class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(:created_at)
    @sent_bookings = current_user.bookings
    @received_bookings = current_user.received_bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    # redirect_to van_path(@booking.van_id)
  end

  def create
    @van = Van.find(params[:van_id])
    authorize @van
    @booking = Booking.new(booking_params)
    authorize @booking
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

  def mybookings
    Booking.where(user_id: current_user.id)
  end
end
