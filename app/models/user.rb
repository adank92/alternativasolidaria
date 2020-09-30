class User < ApplicationRecord
  include QuickEditable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum status: [:fresh, :active, :inactive]
  flag :roles, [:chef, :distributor]

  belongs_to :locality
  has_one :department, through: :locality
  has_one :province, through: :department
  has_many :zones, through: :locality
  has_many :collaborations
  has_many :teams, through: :collaborations
  has_and_belongs_to_many :available_days

  delegate :name, to: :locality, prefix: :locality
  delegate :name, to: :department, prefix: :department
  delegate :name, to: :province, prefix: :province

  validates_presence_of :name, :roles, :address
  validates :phone, numericality: true

  scope :available_at, ->(day) { joins(:available_days).where(available_days: { id: day }) if day.present? }
  scope :where_status, ->(status) { where(status: status) if status.present? }
  scope :where_role, ->(role) { where_roles(role) if role.present? }
  scope :where_locality, ->(locality) { where(locality: locality) if locality.present? }
  scope :where_province, ->(province) { joins(:province).where(provinces: { id: province }) if province.present? }
  scope :where_department, ->(department) { joins(:department).where(departments: { id: department }) if department.present? }
  scope :where_zone, ->(zone) { joins(:zones).where(zones: { id: zone }) if zone.present? }
  scope :not_available_for_current_month, ->(not_available) { where.not(id: available_at(AvailableDay.for_current_month)) if not_available.present? }
  scope :search, ->(query) {
    return unless query.present?
    query = sanitize_sql_like(query)
    [:name, :email, :address, :phone].map { |field| where(arel_table[field].matches("%#{query}%")) }.reduce(&:or)
  }

  def collaboration_roles
    roles.flat_map { |r| r == :distributor ? [:drop_off, :pick_up] : r }
  end
end
