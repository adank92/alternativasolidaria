class Collaboration < ApplicationRecord
  belongs_to :team
  belongs_to :user

  default_scope -> { order(:id) }
end
