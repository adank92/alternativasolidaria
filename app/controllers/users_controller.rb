class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @search = UserSearch.new(user_seach_params)
    @pagy, @records = pagy(@search.execute, page: @page)
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

  def user_seach_params
    params.fetch(:user_search, {}).permit(:status, :week, :role, :province_id, :department_id, :locality_id, :text)
  end

  def update_user_params
    params.require(:user).permit(:name, :locality_id, :address, :phone, :admin, :status, week_ids: [], roles: [])
  end
end
