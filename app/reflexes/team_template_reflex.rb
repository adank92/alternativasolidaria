class TeamTemplateReflex < ApplicationReflex
  before_reflex do
    @team_template = find_team_template
    @team_template.assign_attributes(team_params)
  end

  def submit
    @team_template.save
  end

  private

  def find_team_template
    TeamTemplate.find(params[:id])
  end

  def team_params
    params.require(:team_template).permit(:name, :notes, collaborations_attributes: [:id, :meal_quantity], team_destinations_attributes: [:id, :meal_quantity])
  end
end
