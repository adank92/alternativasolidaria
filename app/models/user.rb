class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum status: [:fresh, :active, :inactive]
  flag :roles, [:chef, :distributor]

  belongs_to :locality
  has_one :department, through: :locality
  has_one :province, through: :department
  has_many :available_weeks, dependent: :destroy
  has_many :weeks, through: :available_weeks
  has_and_belongs_to_many :teams

  validates_presence_of :name, :roles, :address
  validates :phone, numericality: true

  scope :where_status, ->(status) { where(status: status) if status.present? }
  scope :available_for_week, ->(week) { joins(:weeks).where(weeks: { id: week }) if week.present? }
  scope :where_role, ->(role) { where_roles(role) if role.present? }
  scope :where_locality, ->(locality) { where(locality: locality) if locality.present? }
  scope :where_province, ->(province) { joins(:province).where(provinces: { id: province }) if province.present? }
  scope :where_department, ->(department) { joins(:department).where(departments: { id: department }) if department.present? }
  scope :search, ->(query) {
    return unless query.present?
    query = sanitize_sql_like(query)
    [:name, :email, :address, :phone].map { |field| where(arel_table[field].matches("%#{query}%")) }.reduce(&:or)
  }

  def collaboration_roles
    roles.flat_map { |r| r == :distributor ? [:drop_off, :pick_up] : r }
  end
end
