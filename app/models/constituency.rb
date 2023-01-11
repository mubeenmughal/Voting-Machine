# frozen_string_literal: true

class Constituency < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :candidateships, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def candidates_of_constituency(poll)
    User.joins(:candidateships).where(candidateships: { polling_id: poll.id,
                                                        status: Candidateship.statuses['accepted'] })
  end
end
