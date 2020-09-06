module UsersHelper
  def status_options
    User.statuses.map do |name, value|
      [name, t("activerecord.enums.user.status.#{name}")]
    end
  end

  def status_icon(status)
    return ("<i class='fas fa-user-plus text-primary' title='Nuevo'></i>").html_safe if status == 'fresh'
    return ("<i class='fas fa-user-check text-success' title='Activo'></i>").html_safe if status == 'active'
    ("<i class='fas fa-user-times text-danger' title='Inactivo'></i>").html_safe
  end

  def role_icon(role, index)
    return ("<i class='fas fa-pizza-slice #{"ml-2" if index.equal?(1)}' style='font-size: 1.5em' title='Cocinero'></i>").html_safe if role == :chef
    ("<i class='fas fa-truck #{"ml-2" if index.equal?(1)}' style='font-size: 1.5em' title='Repartidor'></i>").html_safe
  end
end
