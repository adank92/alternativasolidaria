class UserSearch
  include ActiveModel::Model
  attr_accessor :status, :week, :role, :province_id, :department_id, :locality_id, :text, :departments, :localities,
                :page

  def execute
    User.where_status(status).available_for_week(week).where_role(role).where_province(province_id)
        .where_department(department_id).where_locality(locality_id).search(text)
  end

  def province
    Province.find(province_id) if province_id.present?
  end

  def provinces
    Province.all
  end

  def departments
    @departments = province&.departments || Department.all
  end

  def localities
    @localities = province&.localities || Locality.all
  end
end
