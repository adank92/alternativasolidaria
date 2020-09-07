# frozen_string_literal: true

class TabularReflex < ApplicationReflex
  def submit
    @page = 1
  end

  def change_page
    @page = element.data_attributes["page"].to_i
  end
end
