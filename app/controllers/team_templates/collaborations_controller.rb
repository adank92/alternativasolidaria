class TeamTemplates::CollaborationsController < AdminController
  before_action :set_team_template

  def index
    @search = UserSearch.new(user_seach_params)
    @pagy, @records = pagy(@search.execute, page: @search.page)
  end

  private

  def set_team_template
    @team = TeamTemplate.find(params[:team_template_id])
  end

  def user_seach_params
    params.fetch(:search, {}).permit(:status, :week, :role, :province_id, :department_id, :locality_id, :text, :page)
  end
end
