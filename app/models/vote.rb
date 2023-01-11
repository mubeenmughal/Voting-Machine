# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :voter, class_name: 'User'
  belongs_to :candidate, class_name: 'User'
  belongs_to :constituency
  belongs_to :polling

  validates :voter_id, uniqueness: { scope: %i[constituency_id polling_id] }
end
