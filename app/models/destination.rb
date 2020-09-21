class Destination < ApplicationRecord
  belongs_to :locality
  has_one :department, through: :locality
  has_one :province, through: :department

  validates_presence_of :name, :address
  validates :phone, numericality: true

  scope :where_locality, ->(locality) { where(locality: locality) if locality.present? }
  scope :where_province, ->(province) { joins(:province).where(provinces: { id: province }) if province.present? }
  scope :where_department, ->(department) { joins(:department).where(departments: { id: department }) if department.present? }
  scope :search, ->(query) {
    return unless query.present?
    query = sanitize_sql_like(query)
    [:name, :address, :phone].map { |field| where(arel_table[field].matches("%#{query}%")) }.reduce(&:or)
  }
end
