class TeamDestination < ApplicationRecord
  belongs_to :team, polymorphic: true
  belongs_to :destination
end
