class Locality < ApplicationRecord
  belongs_to :department
  has_and_belongs_to_many :zones
  default_scope { order(:name) }
end
