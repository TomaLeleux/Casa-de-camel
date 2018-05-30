class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).order(updated_at: :desc)
  end

  def show
    @booking = policy_scope(Booking).find(params[:id])
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @camel = Camel.find(params[:camel_id])
    @booking.user = current_user
    @booking.camel = @camel
    if @booking.save
      redirect_to bookings_path
    else
      render "bookings#show"
    end
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to camel_bookings_path(@booking.camel)
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to camel_bookings_path(@booking.camel)
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
