module Collaboratable
  extend ActiveSupport::Concern

  included do
    has_many :collaborations, dependent: :destroy
    has_many :chef_collaborations, -> { where(role: 'chef') }, class_name: 'Collaboration'
    has_many :drop_off_collaborations, -> { where(role: 'drop_off') }, class_name: 'Collaboration'
    has_many :pick_up_collaborations, -> { where(role: 'pick_up') }, class_name: 'Collaboration'
    has_many :chef_collaborators, through: :chef_collaborations, source: :user
    has_many :drop_off_collaborators, through: :drop_off_collaborations, source: :user
    has_many :pick_up_collaborators, through: :pick_up_collaborations, source: :user

    accepts_nested_attributes_for :collaborations
  end

  def has_collaborator?(user, as:)
    collaborations.any? { |c| c.user_id == user.id && c.role == as.to_s }
  end

  def can_send_pick_up_email?
    pick_up_date.present? && pick_up_time_range.present? && chef_collaborators.any? && pick_up_collaborators.any? && (destinations.any? || intermediate_destination.present?)
  end

  def pick_up_email_sent?
    pick_up_email_sent_at.present?
  end

  def send_pick_up_email
    CollaborationMailer.with(team: self, user: pick_up_collaborators.first).pick_up_email.deliver_now
    update(pick_up_email_sent_at: Time.current)
  end
end
