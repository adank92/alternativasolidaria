class Team < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :chefs, -> { where(collaborations: { role: 'chef' }) }, through: :collaborations, source: :user
  has_many :distributors, -> { where(collaborations: { role: 'distributor' }) }, through: :collaborations, source: :user

  scope :by_pick_up_date, -> (date) { where(pick_up_date: date) if date.present? }
  scope :by_drop_off_date, -> (date) { where(drop_off_date: date) if date.present? }
  scope :like_name, -> (name) { where(arel_table[:name].matches("%#{name}%")) if name.present? }

  def has_collaborator?(user, as:)
    public_send(as.to_s.pluralize).include? user
  end
end
