class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_user_filters

  def index
    @pagy, @records = pagy(find_users, page: @page)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_user_params)
      flash[:success] = "El usuario se actualizó correctamente"
      redirect_to action: :index
    else
      render :edit
    end
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
    @departments = session[:departments] || Department.all
    @locality = session[:locality].to_s
    @localities = session[:localities] || Locality.all
    @page = (session[:page] || 1).to_i
  end

  def find_users
    User.where_status(@status).available_for_week(@week).where_role(@role).where_province(@province)
        .where_department(@department).where_locality(@locality)
  end

  def update_user_params
    params.require(:user).permit(:first_name, :last_name, :locality_id, :address, :phone, :admin, :status, week_ids: [], roles: [])
  end
end
