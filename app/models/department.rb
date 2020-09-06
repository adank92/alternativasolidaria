class Department < ApplicationRecord
  has_many :localities, dependent: :destroy
  belongs_to :province
end
