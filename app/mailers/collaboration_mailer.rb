class CollaborationMailer < ApplicationMailer
  layout 'mailer'

  def pick_up_email
    @team = params[:team]
    @user = params[:user]
    mail(to: @team.pick_up_collaborators.pluck(:email), subject: 'Recorrido de retiro')
  end
end
