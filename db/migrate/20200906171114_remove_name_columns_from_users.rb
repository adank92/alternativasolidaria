class RemoveNameColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :first_name, :name
    remove_column :users, :last_name, :string
  end
end
