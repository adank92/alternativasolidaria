class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @search =  DestinationSearch.new(search_params)
    @pagy, @records = pagy(@search.execute, page: @search.page)
  end

  def new
    @destination ||= Destination.new
    @destination.locality = Locality.first
  end

  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_url, notice: 'El destino se borró exitosamente.'
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name, :address, :locality_id, :phone, :meal_quantity)
  end

  def search_params
    params.fetch(:search, {}).permit(:name, :address, :province_id, :department_id, :locality_id, :text, :page)
  end
end
