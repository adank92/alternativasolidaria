class Collaboration < ApplicationRecord
  belongs_to :team
  belongs_to :user

  default_scope -> { order(:id) }

  def user
    super || NullUser.new
  end
end
