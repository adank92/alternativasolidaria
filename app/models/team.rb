class Team < ApplicationRecord
  include Collaboratable
  include Destinatable

  scope :by_pick_up_date, -> (date) { where(pick_up_date: date) if date.present? }
  scope :like_name, -> (name) { where(arel_table[:name].matches("%#{name}%")) if name.present? }
end
