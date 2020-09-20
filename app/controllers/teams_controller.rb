class TeamsController < AdminController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @search = TeamSearch.new(seach_params)
    @pagy, @records = pagy(@search.execute, page: @search.page)
  end

  def new
    @team ||= Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    if @team.update(team_params.merge(final: true))
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'El equipo se borró exitosamente.'
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :drop_off_date, :pick_up_date, :drop_off_time_range, :pick_up_time_range, :destination, :notes, collaborations_attributes: [:id, :meal_quantity])
  end

  def seach_params
    params.fetch(:search, {}).permit(:drop_off_date, :pick_up_date, :text, :page)
  end
end
