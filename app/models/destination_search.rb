class DestinationSearch
  include ActiveModel::Model
  attr_accessor :name, :address, :province_id, :locality_id, :text, :page

  def execute
    Destination.where_province(province_id).where_locality(locality_id).search(text).includes(:locality, :province)
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
