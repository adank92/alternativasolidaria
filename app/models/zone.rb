class Zone < ApplicationRecord
  has_and_belongs_to_many :localities

  validates_presence_of :name

  scope :search, ->(query) {
    return unless query.present?
    query = sanitize_sql_like(query)
    joins(:localities).where(arel_table[:name].matches("%#{query}%").or(Locality.arel_table[:name].matches("%#{query}%"))).distinct
  }
end
