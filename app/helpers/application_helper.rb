module ApplicationHelper
  include Pagy::Frontend

  def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-danger"
    end
  end

  def prev_page
    @pagy.prev || 1
  end

  def next_page
    @pagy.next || @pagy.last
  end
end
