class CamelsController < ApplicationController
  before_action :set_camel, only: [:show, :edit, :update, :destroy]

  def index
    @camels = policy_scope(Camel).order(created_at: :desc)
  end

  def show
    @camel = policy_scope(Camel).find(params[:id])
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
    redirect_to camels_path
  end

  def destroy
    authorize @camel
    @camel.destroy
    redirect_to camels_path
  end

  private

  def camel_params
    params.require(:camel).permit(:name, :localisation, :number_of_place, :food_type,
                                  :color, :wifi, :chameaux_fiscaux, :vitesse_max, :photo)
  end

  def set_camel
    @camel = Camel.find(params[:id])
    authorize @camel
  end
end
