# frozen_string_literal: true

class TabularReflex < ApplicationReflex
  def change_week
    session[:week] = element[:value]
    reset_page
  end

  def change_role
    session[:role] = element[:value]
    reset_page
  end

  def change_locality
    session[:locality] = element[:value]
    reset_page
  end

  def change_province
    session[:province] = element[:value]
    reset_page
  end

  def paginate
    session[:page] = element.dataset[:page].to_i
  end

  def reset_page
    session[:page] = 1
  end
end
