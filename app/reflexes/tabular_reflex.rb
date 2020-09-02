# frozen_string_literal: true

class TabularReflex < ApplicationReflex
  def search
    session[:week] = element[:value]
  end
end
