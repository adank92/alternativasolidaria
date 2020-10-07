class UserSearch
  include ActiveModel::Model

  DEFAULT_STATUSES = [:fresh, :active].freeze

  attr_accessor :status, :day, :role, :province_id, :locality_id, :text, :localities,
                :zone_id, :page, :not_available_for_current_month

  def execute
    User.where_status(status_or_default).available_at(day).where_role(role).where_province(province_id)
        .where_locality(locality_id).where_zone(zone_id).not_available_for_current_month(not_available_for_current_month).search(text)
        .includes(:locality, :province)
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

  def localities
    @localities = province&.localities || Locality.all
  end
end
