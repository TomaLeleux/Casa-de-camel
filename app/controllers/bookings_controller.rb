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
      render "camels/show"
    end
  end

  def edit
    authorize @booking
    @book = []
    booked = Booking.where.not(id: @booking.id)
    booked.each do |book|
      begindate = book.date_start
      enddate = book.date_end
      @book << (BookedDate.new(Date.new(begindate.year,begindate.month,begindate.day),Date.new(enddate.year,enddate.month,enddate.day))).set_range
    end
    @book = @book.flatten
    gon.book = @book
  end

  def update
    authorize @booking
    if params[:commit] == 'Accept' && current_user == @booking.camel.user
      @booking.update(status: 'validated')
      redirect_to dashboard_path
    elsif params[:commit] == 'Refuse' && current_user == @booking.camel.user
      @booking.update(status: 'declined')
      redirect_to dashboard_path
    else
      @booking.update(booking_params)
      redirect_to bookings_path
    end
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
