class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_user_filters

  def index
    @pagy, @records = pagy(User.available_for_week(@week).with_role(@role), page: @page)
  end

  private

  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end

  def set_user_filters
    @week = session[:week]
    @role = session[:role]
    @page = (session[:page] || 1).to_i
  end
end
