class UpdateDistributorsToDropOff < ActiveRecord::Migration[6.0]
  def up
    Collaboration.where(role: "distributor").update_all(role: "drop_off")
  end

  def down
    Collaboration.where(role: "drop_off").update_all(role: "distributor")
  end
end
