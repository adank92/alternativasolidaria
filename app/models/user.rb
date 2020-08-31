class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  flag :roles, [:chef, :delivery]

  belongs_to :locality
  has_one :department, through: :locality
  has_one :province, through: :department

  validates_presence_of :first_name, :last_name, :roles
  validates :phone, numericality: true
end
