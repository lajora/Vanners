class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(:created_at)
    @sent_bookings = current_user.bookings
    @received_bookings = current_user.received_bookings
    @owner = 0
    current_user.vans.each do |van|
      @bookings.each do |booking|
      @owner += 1 if booking.van == van
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @owner = 0
    current_user.vans.each do |van|
      @owner += 1 if @booking.van == van
    end
    @date_from = params[:date_from].present? ? Date.strptime(params[:date_from], '%Y-%m-%d') : Date.today()
    @date_to = params[:date_to].present? ? Date.strptime(params[:date_to], '%Y-%m-%d') : @date_from + 7
    @num_days = (@date_to - @date_from).to_i
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
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    booking.status = "accepted"
    booking.save!
    redirect_to bookings_path
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    authorize @booking
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

  def is_owner?
    owner = 0
    return true if owner != 0
  end
end
