class ChangeForeignKeyInCollaborations < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :collaborations, :users
    add_foreign_key :collaborations, :users, on_delete: :nullify
    change_column_null :collaborations, :user_id, true
  end
end
