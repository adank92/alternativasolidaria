# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :load_current_available_weeks, only: [:new, :create]

  protected

  def load_current_available_weeks
    @current_available_weeks = Week.for_current_month.map do |week|
      AvailableWeek.new(week: week)
    end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :locality_id, :address, :phone, roles: [], available_weeks_attributes: [:week_id]])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :locality_id, :address, :phone, roles: [], available_weeks_attributes: [:week_id]])
  end
end
