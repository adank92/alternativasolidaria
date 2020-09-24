class AddQuickEditTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :quick_edit_token, :string
  end
end
