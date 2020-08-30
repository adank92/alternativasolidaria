class Province < ApplicationRecord
  has_many :departments
  has_many :localities, through: :departments
end
