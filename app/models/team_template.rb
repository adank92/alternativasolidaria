class TeamTemplate < ApplicationRecord
  include Collaboratable

  has_many :teams

  scope :like_name, -> (name) { where(arel_table[:name].matches("%#{name}%")) if name.present? }

  def create_team
    teams.create(name: name, collaborations: collaborations.map(&:dup))
  end
end
