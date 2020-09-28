class UserSearch
  include ActiveModel::Model

  DEFAULT_STATUSES = [:fresh, :active].freeze

  attr_accessor :status, :day, :role, :province_id, :department_id, :locality_id, :text, :departments, :localities,
                :zone_id, :page

  def execute
    User.where_status(status_or_default).available_at(day).where_role(role).where_province(province_id)
        .where_department(department_id).where_locality(locality_id).where_zone(zone_id).search(text)
        .includes(:department, :locality, :province)
  end

  def status_or_default
    @status.presence || DEFAULT_STATUSES
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
