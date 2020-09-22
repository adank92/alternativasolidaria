module Destinatable
  extend ActiveSupport::Concern

  included do
    has_many :team_destinations, as: :team
    has_many :destinations, through: :team_destinations

    accepts_nested_attributes_for :team_destinations
  end
end
