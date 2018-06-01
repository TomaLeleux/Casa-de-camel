class CamelsController < ApplicationController
  before_action :set_camel, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:query].present?
      @camels = policy_scope(Camel.global_search(params[:query]))
      @camelsMap = @camels
    else
      @camels = policy_scope(Camel).order(created_at: :desc)
      @camelsMap = Camel.where.not(latitude: nil, longitude: nil)
    end
    @markers = @camelsMap.map do |camel|
      {
        lat: camel.latitude,
        lng: camel.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @camel = policy_scope(Camel).find(params[:id])
    @review = Review.new

    @markers =
      {
        lat: @camel.latitude,
        lng: @camel.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    @booking = Booking.new
    @book = []
    booked = @camel.bookings
    booked.each do |book|
      begindate = book.date_start
      enddate = book.date_end
      @book << (BookedDate.new(Date.new(begindate.year,begindate.month,begindate.day),Date.new(enddate.year,enddate.month,enddate.day))).set_range
      end
    @book = @book.flatten
    gon.book = @book

  end

  def new
    @camel = Camel.new
    authorize @camel
  end

  def create
    @camel = Camel.new(camel_params)
    authorize @camel
    @camel.user = current_user
    if @camel.save
      redirect_to camel_path(@camel)
    else
      render :new
    end
  end

  def edit
  end

  def update
    authorize @camel
    @camel.update(camel_params)
    redirect_to camel_path(@camel)
  end

  def destroy
    authorize @camel
    @camel.destroy
    redirect_to root_path
  end

  private

  def camel_params
    params.require(:camel).permit(:name, :country, :number_of_place, :food_type,
                                  :color, :wifi, :chameaux_fiscaux, :vitesse_max, :photo,
                                  :description, :price_per_day, :address, :latitude, :longitude)
  end

  def set_camel
    @camel = Camel.find(params[:id])
    authorize @camel
  end
end
