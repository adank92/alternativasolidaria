class LocalitiesController < ApplicationController
  layout false

  def index
    province = Province.find(params[:province_id])
    @localities = province.localities
  end
end
