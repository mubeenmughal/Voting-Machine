# frozen_string_literal: true

module PollDetails
  extend ActiveSupport::Concern

  def load_poll_details
    if @poll.poll_has_votes? && @poll.poll_ended?
      find_poll_result
    else
      find_candidates
    end
  end

  def find_poll_result
    @polling_result = @poll.poll_result(current_user)
    winner = @polling_result.max_by { |_cand_id, votes| votes }
    @winner_candidate = User.find(winner.first)
    @votes = winner.second
  end

  def find_candidates
    @candidates = current_user.constituency.candidates_of_constituency(@poll)
  end
end
