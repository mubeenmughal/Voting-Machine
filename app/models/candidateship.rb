# frozen_string_literal: true

# candidateship is that application or request that voter create to represent admin to become candidate
class Candidateship < ApplicationRecord
  belongs_to :user
  belongs_to :party
  belongs_to :polling
  belongs_to :constituency

  validates :status, presence: true
  validate :poll_start_time, :status_transition

  enum status: { pending: 0, accepted: 1, rejected: 2 }

  after_initialize :set_default_status, if: :new_record?
  before_update :change_user_role

  private

  def poll_start_time
    return if polling.start_time > Time.current

    errors.add(:base, 'Polling has been started!')
  end

  def status_transition
    # return unless status_changed? || %w[accepted rejected].include(status) || status_was.eql?('pending')

    # errors.add(:base, 'Invalid Status change')
  end

  def set_default_status
    self.status ||= 'pending'
  end

  def change_user_role
    return unless accepted?

    user.role = 'candidate'
    user.save!
  end
end
