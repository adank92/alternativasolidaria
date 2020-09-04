class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_user_filters

  def index
    @pagy, @records = pagy(find_users, page: @page)
  end

  private

  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end

  def set_user_filters
    @status = session[:status].to_s
    @week = session[:week].to_s
    @role = session[:role].to_s
    @province = session[:province].to_s
    @department = session[:department].to_s
    @departments = session[:departments] || Province.first.departments
    @locality = session[:locality].to_s
    @localities = session[:localities] || Province.first.localities
    @page = (session[:page] || 1).to_i
  end

  def find_users
    User.where_status(@status).available_for_week(@week).where_role(@role).where_province(@province)
        .where_department(@department).where_locality(@locality)
  end
end
