class BazaarsController < ApplicationController
  before_action :set_bazaar, only: [:show, :edit, :update, :destroy]
  def index
    @bazaars = Bazaar.all
  end
  
  def new
    @bazaar = Bazaar.new
  end
  
  def create
    @bazaar = Bazaar.new(bazaar_params)
    @bazaar.user = current_user
    if @bazaar.save
      redirect_to @bazaar
    else
      render :new
    end
  end
  
  def show
  end
  
  private
  
  def set_bazaar
    @bazaar = Bazaar.find(params[:id])
  end
  
  def bazaar_params
    params.require(:bazaar).permit([:title, :intro, :address, :lat, :lng, :status])
  end
end
