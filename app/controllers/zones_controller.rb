class ZonesController < AdminController
  before_action :set_zone, only: [:edit, :update, :destroy]

  def index
    @search = ZoneSearch.new(seach_params)
    @pagy, @records = pagy(@search.execute, page: @search.page)
  end

  def new
    @zone = Zone.new
  end

  def create
    @zone = Zone.new(zone_params)

    if @zone.save
      redirect_to action: :index, notice: 'La zona fue creada.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @zone.update(zone_params)
      redirect_to action: :index, notice: 'La zona fue actualizada.'
    else
      render :edit
    end
  end

  def destroy
    @zone.destroy
    redirect_to action: :index, notice: 'La zona fue eliminada.'
  end

  private

  def set_zone
    @zone = Zone.find(params[:id])
  end

  def seach_params
    params.fetch(:search, {}).permit(:text, :page)
  end

  def zone_params
    params.require(:zone).permit(:name, locality_ids: [])
  end
end
