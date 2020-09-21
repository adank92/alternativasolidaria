class RemoveProvincOfDestinations < ActiveRecord::Migration[6.0]
  def change
    remove_column :destinations, :province_id
  end
end
