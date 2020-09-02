class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  flag :roles, [:chef, :delivery]

  belongs_to :locality
  has_one :department, through: :locality
  has_one :province, through: :department
  has_many :available_weeks
  has_many :weeks, through: :available_weeks

  accepts_nested_attributes_for :available_weeks, reject_if: :all_blank

  validates_presence_of :first_name, :last_name, :roles
  validates :phone, numericality: true

  scope :available_for_week, ->(week) { includes(:weeks).where(weeks: { id: week }) if week.present? }
end
