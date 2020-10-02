# frozen_string_literal: true

class TeamReflex < ApplicationReflex
  before_reflex do
    @team = find_team
  end

  def submit
    @team.update(team_params)
  end

  def send_pick_up_information
    @team.send_pick_up_email
  end

  private

  def find_team
    Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :pick_up_date, :pick_up_time_range, :intermediate_destination, :notes, collaborations_attributes: [:id, :meal_quantity], team_destinations_attributes: [:id, :meal_quantity])
  end
end
