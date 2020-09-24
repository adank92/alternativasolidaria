class RemovePolymorphicAssociations < ActiveRecord::Migration[6.0]
  def up
    TeamDestination.where(team_type: 'TeamTemplate').destroy_all
    remove_column :team_destinations, :team_type
    change_column :team_destinations, :team_id, :bigint, null: false, index: true, foreign_key: true

    Collaboration.where(collaboratable_type: "TeamTemplate").destroy_all
    remove_column :collaborations, :collaboratable_type
    rename_column :collaborations, :collaboratable_id, :team_id
    change_column :collaborations, :team_id, :bigint, null: false, index: true, foreign_key: true
  end
end
