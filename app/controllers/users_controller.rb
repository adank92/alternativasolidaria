class UsersController < AdminController
  before_action :set_user, except: :index

  def index
    @search = UserSearch.new(user_seach_params)
    @pagy, @records = pagy(@search.execute, page: @search.page)
  end

  def edit
  end

  def update
    if @user.update(update_user_params)
      redirect_to users_path, notice: "El usuario fue actualizado"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "El usuario fue borrado"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_seach_params
    params.fetch(:search, {}).permit(:status, :day, :role, :province_id, :department_id, :locality_id, :zone_id, :text, :not_available_for_current_month, :page)
  end

  def update_user_params
    params.require(:user).permit(:name, :email, :locality_id, :address, :phone, :admin, :status, available_day_ids: [], roles: [])
  end
end
