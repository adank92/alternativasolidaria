module UsersHelper
  def role_icon(role, index)
    return ("<i class=\"fas fa-pizza-slice#{" ml-1" if index.equal?(1)}\" style=\"font-size: 1.5em\" title=\"Cocinero\"></i>").html_safe if role == :chef
    ("<i class=\"fas fa-truck#{" ml-1" if index.equal?(1)}\" style=\"font-size: 1.5em\" title=\"Repartidor\"></i>").html_safe
  end
end
