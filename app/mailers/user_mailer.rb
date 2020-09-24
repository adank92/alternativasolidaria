class UserMailer < ApplicationMailer
  def quick_edit_email
    @user = params[:user]
    @month = params[:month]
    @token = params[:token]
    mail(to: @user.email, subject: "Completar datos para #{@month}")
  end
end
