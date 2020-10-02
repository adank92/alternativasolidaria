class AddPickUpEmailSentAtToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :pick_up_email_sent_at, :datetime
  end
end
