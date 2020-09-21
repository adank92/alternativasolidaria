# frozen_string_literal: true

class TeamReflex < ApplicationReflex
  before_reflex do
    @team = find_team
    @team.assign_attributes(team_params)
  end

  def submit
    @team.save
  end

  private

  def find_team
    Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :pick_up_date, :pick_up_time_range, :destination, :notes, collaborations_attributes: [:id, :meal_quantity])
  end
end
