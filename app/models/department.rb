class Department < ApplicationRecord
  has_many :localities
  belongs_to :province
end
