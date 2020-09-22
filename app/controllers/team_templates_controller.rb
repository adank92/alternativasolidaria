class TeamTemplatesController < AdminController
  before_action :set_team_template, only: [:show, :edit, :update, :destroy]

  def index
    @search = TeamTemplateSearch.new(seach_params)
    @pagy, @records = pagy(@search.execute, page: @search.page)
  end

  def new
    @team_template = TeamTemplate.new
  end

  def create
    @team_template = TeamTemplate.new(team_template_params)

    if @team_template.save
      redirect_to edit_team_template_path(@team_template)
    else
      render :new
    end
  end

  def update
    if @team_template.update(team_template_params.merge(final: true))
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @team_template.destroy
    redirect_to action: :index, notice: 'El equipo se borró exitosamente.'
  end

  private

  def set_team_template
    @team_template = TeamTemplate.find(params[:id])
  end

  def team_template_params
    params.require(:team_template).permit(:name, :notes, collaborations_attributes: [:id, :meal_quantity], team_destinations_attributes: [:id, :meal_quantity])
  end

  def seach_params
    params.fetch(:search, {}).permit(:text, :page)
  end
end
