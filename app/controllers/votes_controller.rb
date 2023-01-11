# frozen_string_literal: true

require 'date'
class VotesController < ApplicationController
  def create
    @vote = VoteService.new(params, current_user).create_vote
    render js: "alert('vote not casted');" unless @vote.save
    @poll = Polling.find(params[:poll_id])
    @candidates = current_user.constituency.candidates_of_constituency(@poll)
  end
end
