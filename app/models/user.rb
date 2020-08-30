class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :locality
  has_one :department, through: :locality
  has_one :province, through: :department

  validates_presence_of :first_name, :last_name
  validates :phone, numericality: true
end
