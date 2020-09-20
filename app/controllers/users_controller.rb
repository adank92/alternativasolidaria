class UsersController < AdminController
  def index
    @search = UserSearch.new(user_seach_params)
    @pagy, @records = pagy(@search.execute, page: @search.page)
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

  def user_seach_params
    params.fetch(:search, {}).permit(:status, :week, :role, :province_id, :department_id, :locality_id, :text, :page)
  end

  def update_user_params
    params.require(:user).permit(:name, :email, :locality_id, :address, :phone, :admin, :status, week_ids: [], roles: [])
  end
end
