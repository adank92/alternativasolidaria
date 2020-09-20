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

  def role_icon(role, color = '')
    case role
    when :chef
      ("<i class='fas fa-pizza-slice #{color}' style='font-size: 1.5em' title='Cocina'></i>").html_safe
    when :distributor
      ("<i class='fas fa-truck #{color}' style='font-size: 1.5em' title='Reparte'></i>").html_safe
    when :drop_off
      ("<i class='fas fa-box-open #{color}' style='font-size: 1.5em' title='Entrega'></i>").html_safe
    when :pick_up
      ("<i class='fas fa-box #{color}' style='font-size: 1.5em' title='Retira'></i>").html_safe
    else
      ''
    end
  end
end
