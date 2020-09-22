class RenameDestinationFromTeams < ActiveRecord::Migration[6.0]
  def change
    rename_column :teams, :destination, :intermediate_destination
  end
end
