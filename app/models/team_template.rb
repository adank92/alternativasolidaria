class TeamTemplate < ApplicationRecord
  include Collaboratable
  include Destinatable

  has_many :teams

  scope :like_name, -> (name) { where(arel_table[:name].matches("%#{name}%")) if name.present? }

  def create_team
    teams.create(name: name, collaborations: collaborations.map(&:dup), team_destinations: team_destinations.map(&:dup))
  end
end
