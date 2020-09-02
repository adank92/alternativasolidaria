class UsersController < ApplicationController
  def index
    @users = User.available_for_week(session[:week]).paginate(page: params[:page])
  end
end
