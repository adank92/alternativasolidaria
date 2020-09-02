class AvailableWeek < ApplicationRecord
  belongs_to :user
  belongs_to :week

  delegate :name, to: :week
end
