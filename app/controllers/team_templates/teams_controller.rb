class TeamTemplates::TeamsController < AdminController
  def create
    team_template = TeamTemplate.find(params[:team_template_id])
    team = team_template.create_team
    redirect_to edit_team_path(team)
  end
end
