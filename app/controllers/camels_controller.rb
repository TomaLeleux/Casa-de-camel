class CamelsController < ApplicationController
  before_action :set_camel, only: [:show, :edit, :update, :destroy]

  def index
    @camels = policy_scope(Camel).order(created_at: :desc)
  end

  def show
    @camel = policy_scope(Camel).find(params[:id])
  end

  def new
    @camel = current_user.camels.new
    authorize @camel
  end

  def create
    @camel = current_user.camels.new(camel_params)
    authorize @camel
  end

  def edit
  end

  def update
    authorize @camel
  end

  def destroy
    authorize @camel
  end

  private

  def camel_params
    params.require(:camel).permit(:name, :localisation, :number_of_place, :food_type,
                                  :color, :wifi, :chameaux_fiscaux, :vitesse_max, :photo)
  end

  def set_task
    @camel = Camel.find(params[:id])
    authorize @camel
  end
end
