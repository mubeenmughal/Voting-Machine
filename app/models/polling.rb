# frozen_string_literal: true

require 'date'
class Polling < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :candidateships, dependent: :destroy

  validates :start_time, :end_time, presence: true
  validate :end_time_greater_than_start_time, :polling_start, if: -> { errors.blank? }

  scope :active_polls, -> { where('end_time > :now AND start_time <= :now', now: Time.current) }
  scope :coming_polls, -> { where('start_time > ?', Time.current) }
  scope :recent_polls, -> { where('end_time < ?', Time.current) }

  def winner_candidate(current_user)
    poll_result = votes.group(:candidate_id).having(current_user.constituency_id == :constituency_id).count
    poll_result.max_by { |_cand_id, votes| votes }
  end

  def constituencies_of_candidate(current_user)
    Constituency.joins(:candidateships).where(candidateships: { user_id: current_user.id })
  end

  def poll_has_votes?
    votes.exists?
  end

  def poll_result(current_user)
    votes.group(:candidate_id).having(current_user.constituency_id == :constituency_id).count
  end

  def poll_ended?
    end_time < Time.current
  end

  def poll_started?
    start_time <= Time.current
  end

  private

  def end_time_greater_than_start_time
    return if end_time > start_time

    errors.add(:base, 'End date must be greater than start date')
  end

  def polling_start
    return unless poll_started?

    errors.add(:base, 'Polling has been started!')
  end
end
