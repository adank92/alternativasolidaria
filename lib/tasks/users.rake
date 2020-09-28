namespace :users do
  task send_quick_edit_emails: :environment do
    users = User.where.not(status: :inactive).where_role(:chef).reject { |u| u.email.include?("no_existe") }
    users.map(&:send_quick_edit_email)
  end
end
