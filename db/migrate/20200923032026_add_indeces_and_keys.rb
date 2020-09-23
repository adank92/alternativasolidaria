class AddIndecesAndKeys < ActiveRecord::Migration[6.0]
  def up
    add_index :collaborations, :team_id
    add_foreign_key :collaborations, :teams

    add_index :team_destinations, :team_id
    add_foreign_key :team_destinations, :teams
  end
end
