class Locality < ApplicationRecord
  belongs_to :department
  default_scope { order(:name) }
end
