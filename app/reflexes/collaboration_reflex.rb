class CollaborationReflex < ApplicationReflex
  before_reflex do
    @team = find_team
    @user_id = element.dataset[:user_id]
    @role = element.dataset[:role]
  end

  def create
    @team.collaborations.create(user_id: @user_id, role: @role)
  end

  def destroy
    @team.collaborations.destroy_by(user_id: @user_id, role: @role)
  end

  private

  def find_team
    Team.find(params[:team_id])
  end
end
