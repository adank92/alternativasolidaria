class CollaborationMailer < ApplicationMailer
  def pick_up_information_email
    @team = params[:team]
    @user = params[:user]
    mail(bcc: @team.pick_up_collaborators.pluck(:email), subject: 'Recorrido de retiro')
  end
end
