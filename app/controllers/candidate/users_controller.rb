# frozen_string_literal: true

module Candidate
  class UsersController < ApplicationController
    def show
      authorize User, policy_class: Candidate::UserPolicy
      @constituencies = current_user.candidate_constituencies.includes(:users).distinct
    end
  end
end
