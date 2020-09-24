class DropTeamTemplates < ActiveRecord::Migration[6.0]
  def up
    remove_column :teams, :team_template_id
    drop_table :team_templates
  end
end
