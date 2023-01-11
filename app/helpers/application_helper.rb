# frozen_string_literal: true

module ApplicationHelper
  def vote_casted_for(poll)
    poll.votes.find_by(voter_id: current_user.id)&.candidate
  end

  def candidate_name(cand_id)
    User.find(cand_id).name
  end
end
