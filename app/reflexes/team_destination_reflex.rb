class TeamDestinationReflex < ApplicationReflex
  before_reflex do
    @team = find_team
    @destination = find_destination
  end

  def create
    @team.destinations << @destination
  end

  def destroy
    @team.team_destinations.destroy_by(destination: @destination)
  end

  private

  def find_team
    Team.find(params[:team_id])
  end

  def find_destination
    Destination.find(element.dataset[:destination_id])
  end
end
