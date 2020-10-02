# Preview all emails at http://localhost:3000/rails/mailers/collaboration_mailer
class CollaborationMailerPreview < ActionMailer::Preview
  def pick_up_email
    CollaborationMailer.with(user: User.first, team: Team.first).pick_up_email
  end
end
