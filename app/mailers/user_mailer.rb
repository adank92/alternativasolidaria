class UserMailer < ApplicationMailer
  def quick_edit_email
    @user = params[:user]
    @token = params[:token]
    @month = I18n.l(Date.today.next_month, format: "%B").capitalize
    mail(to: @user.email, subject: "Completar datos para #{@month}")
  end
end
