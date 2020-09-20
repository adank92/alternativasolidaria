class Team < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :chef_collaborations, -> { where(role: 'chef') }, class_name: 'Collaboration'
  has_many :drop_off_collaborations, -> { where(role: 'drop_off') }, class_name: 'Collaboration'
  has_many :drop_off_collaborators, through: :drop_off_collaborations, source: :user
  has_many :pick_up_collaborations, -> { where(role: 'pick_up') }, class_name: 'Collaboration'
  has_many :pick_up_collaborators, through: :pick_up_collaborations, source: :user

  accepts_nested_attributes_for :collaborations

  scope :by_pick_up_date, -> (date) { where(pick_up_date: date) if date.present? }
  scope :like_name, -> (name) { where(arel_table[:name].matches("%#{name}%")) if name.present? }

  def has_collaborator?(user, as:)
    collaborations.any? { |c| c.user_id == user.id && c.role == as.to_s }
  end
end
