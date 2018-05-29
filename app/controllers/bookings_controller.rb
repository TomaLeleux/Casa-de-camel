class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = policy_scope(Booking).find(params[:id])
  end

  def new
    @booking = current_user.bookings.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @camel = Camel.find(param[:camel_id])
    @booking.user = current_user
    if @booking.save
      redirect_to camel_path(@camel)
    else
      render :new
    end
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to camel_bookings(@booking.camel)
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to camel_bookings(@booking.camel)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
