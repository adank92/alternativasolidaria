class CreateTeamTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :team_templates do |t|
      t.string :name
      t.text :notes
      t.boolean :final, default: false, allow_nil: false

      t.timestamps
    end
  end
end
