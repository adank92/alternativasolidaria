class TeamTemplates::TeamDestinationsController < AdminController
  before_action :set_team_template

  def index
    @search = DestinationSearch.new(search_params)
    @pagy, @records = pagy(@search.execute, page: @search.page)
  end

  private

  def set_team_template
    @team = TeamTemplate.find(params[:team_template_id])
  end

  def search_params
    params.fetch(:search, {}).permit(:name, :address, :province_id, :department_id, :locality_id, :text, :page)
  end
end
