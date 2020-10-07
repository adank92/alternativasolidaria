class Destination < ApplicationRecord
  belongs_to :locality
  has_one :province, through: :locality

  has_many :team_destinations, dependent: :destroy

  validates_presence_of :name, :address
  validates :phone, numericality: true

  scope :where_locality, ->(locality) { where(locality: locality) if locality.present? }
  scope :where_province, ->(province) { joins(:province).where(provinces: { id: province }) if province.present? }
  scope :search, ->(query) {
    return unless query.present?
    query = sanitize_sql_like(query)
    [:name, :address, :phone].map { |field| where(arel_table[field].matches("%#{query}%")) }.reduce(&:or)
  }
end
