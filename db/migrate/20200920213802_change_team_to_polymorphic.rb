class ChangeTeamToPolymorphic < ActiveRecord::Migration[6.0]
  def up
    remove_foreign_key 'collaborations', 'teams'
    add_column :collaborations, :collaboratable_type, :string
    rename_column :collaborations, :team_id, :collaboratable_id
    change_column_null :collaborations, :collaboratable_id, true
    remove_index :collaborations, :collaboratable_id
    add_index :collaborations, [:collaboratable_type, :collaboratable_id], name: 'index_collaboratable_type_and_collaboratable_id'

    Collaboration.update_all(collaboratable_type: 'Team')
  end

  def down
    remove_index :collaborations, column: [:collaboratable_type, :collaboratable_id]
    remove_column :collaborations, :collaboratable_type
    rename_column :collaborations, :collaboratable_id, :team_id
    add_foreign_key 'collaborations', 'teams'
  end
end
