class Province < ApplicationRecord
  has_many :departments, dependent: :destroy
  has_many :localities
end
