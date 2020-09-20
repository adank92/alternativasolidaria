class AddDestinationToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :destination, :text
  end
end
