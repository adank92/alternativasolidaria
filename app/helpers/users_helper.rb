module UsersHelper
  def role_icon(role)
    return 'fas fa-pizza-slice' if role == :chef
    'fas fa-truck'
  end
end
