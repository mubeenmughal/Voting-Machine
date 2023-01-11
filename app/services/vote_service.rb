# frozen_string_literal: true

class VoteService
  def initialize(params, current_user)
    @constituency_id = current_user.constituency_id
    @candidate_id = params[:cand_id]
    @voter_id = current_user.id
    @polling_id = params[:poll_id]
  end

  def create_vote
    @vote = Vote.new(
      constituency_id: @constituency_id,
      candidate_id: @candidate_id,
      voter_id: @voter_id,
      polling_id: @polling_id
    )
  end
end
