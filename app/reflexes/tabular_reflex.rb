# frozen_string_literal: true

class TabularReflex < ApplicationReflex
  def search
    session[:search] = element[:value]
    reset_page
  end

  def change_status
    session[:status] = element[:value]
    reset_page
  end

  def change_week
    session[:week] = element[:value]
    reset_page
  end

  def change_role
    session[:role] = element[:value]
    reset_page
  end

  def change_province
    province = Province.find_by(id: element[:value])
    session[:province] = province&.id
    session[:departments] = province&.departments
    session[:localities] = province&.localities
    session[:department] = nil
    session[:locality] = nil
    reset_page
  end

  def change_department
    session[:department] = element[:value]
    reset_page
  end

  def change_locality
    session[:locality] = element[:value]
    reset_page
  end

  def paginate
    session[:page] = element.dataset[:page].to_i
  end

  private

  def reset_page
    session[:page] = 1
  end
end
