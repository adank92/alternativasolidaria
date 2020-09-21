class Collaboration < ApplicationRecord
  belongs_to :collaboratable, polymorphic: true
  belongs_to :user

  default_scope -> { order(:id) }
end
