# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def quick_edit_email
    user = User.last
    month = 'Octubre'
    token = '12345'
    UserMailer.with(user: user, month: month, token: token).quick_edit_email
  end
end
