class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    if @spot.save
      redirect_to @spot
    else
      render :new
    end
  end

  def show
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit([:title, :intro, :address, :lat, :lng, :status])
  end
end
