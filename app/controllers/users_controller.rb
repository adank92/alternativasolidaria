class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @week = session[:week]
    @users = User.available_for_week(@week).paginate(page: params[:page])
  end

  private

  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end
end
