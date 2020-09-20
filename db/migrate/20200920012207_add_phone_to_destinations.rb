class AddPhoneToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :phone, :string
  end
end
