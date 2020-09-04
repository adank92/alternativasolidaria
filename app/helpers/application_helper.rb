module ApplicationHelper
  include Pagy::Frontend

  def options_for_reflex_select(collection, id_method, value_method, selected, prompt: nil)
    values = collection.map { |o| [o.public_send(value_method), o.public_send(id_method).to_s] }
    values.unshift([prompt, '']) if prompt.present?
    selected = values.find { |v| v.second == selected }
    options_for_select(values, selected)
  end

  def prev_page
    @pagy.prev || 1
  end

  def next_page
    @pagy.next || @pagy.last
  end

  def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-danger"
    end
  end
end
