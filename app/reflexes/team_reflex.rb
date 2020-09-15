# frozen_string_literal: true

class TeamReflex < ApplicationReflex
  before_reflex do
    @team = find_or_build_team
    @team.assign_attributes(team_params)
  end

  def submit
    @team.save
  end

  private

  def find_or_build_team
    return Team.find(params[:team][:id]) if params[:team][:id].present?
    Team.new
  end

  def team_params
    params.require(:team).permit(:name, :drop_off_date, :pick_up_date, :destination, :notes, collaborations_attributes: [:id, :meal_quantity])
  end
end
