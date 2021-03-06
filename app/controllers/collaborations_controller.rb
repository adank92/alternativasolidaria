class CollaborationsController < AdminController
  before_action :set_team

  def index
    @search = UserSearch.new(user_seach_params)
    @pagy, @records = pagy(@search.execute, page: @search.page)
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def user_seach_params
    params.fetch(:search, {}).permit(:status, :day, :role, :province_id, :locality_id, :zone_id, :text, :page)
  end
end
