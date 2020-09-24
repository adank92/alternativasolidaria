class Users::QuickEditsController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(quick_edit_params)
      @user.clear_quick_edit_token
      redirect_to root_path, notice: 'Tus datos fueron guardados. Muchas gracias!'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by!(quick_edit_token: params[:id])
  end

  def quick_edit_params
    params.require(:user).permit(roles: [], available_day_ids: [])
  end
end
