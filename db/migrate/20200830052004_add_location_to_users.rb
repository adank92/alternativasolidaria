class AddLocationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_reference :users, :locality, null: false, foreign_key: true
  end
end
