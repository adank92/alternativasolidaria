class Team < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :chef_collaborations, -> { where(role: 'chef') }, class_name: 'Collaboration'
  has_many :distributor_collaborations, -> { where(role: 'distributor') }, class_name: 'Collaboration'

  accepts_nested_attributes_for :collaborations

  scope :by_pick_up_date, -> (date) { where(pick_up_date: date) if date.present? }
  scope :by_drop_off_date, -> (date) { where(drop_off_date: date) if date.present? }
  scope :like_name, -> (name) { where(arel_table[:name].matches("%#{name}%")) if name.present? }

  def has_collaborator?(user, as:)
    collaborations.any? { |c| c.user_id == user.id && c.role == as.to_s }
  end
end
