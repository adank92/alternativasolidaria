# frozen_string_literal: true

class TabularReflex < ApplicationReflex
  def submit
    params[:search][:page] = 1
  end

  def change_page
    params[:search][:page] = element.data_attributes["page"].to_i
  end
end
