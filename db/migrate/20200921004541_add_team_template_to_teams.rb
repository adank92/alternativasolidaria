class AddTeamTemplateToTeams < ActiveRecord::Migration[6.0]
  def change
    add_reference :teams, :team_template, null: true, foreign_key: true
  end
end
