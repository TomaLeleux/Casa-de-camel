class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
  end

  def create
    authorize @booking
  end

  def destroy
    authorize @booking
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
