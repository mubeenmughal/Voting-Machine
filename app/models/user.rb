# frozen_string_literal: true

class User < ApplicationRecord
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  belongs_to :constituency

  has_one_attached :picture
  has_many :voter_votes, class_name: 'Vote',
                         foreign_key: 'voter_id', dependent: :destroy, inverse_of: :vote
  has_many :candidateships, dependent: :destroy
  has_many :candidate_votes, class_name: 'Vote',
                             foreign_key: 'candidate_id', dependent: :destroy, inverse_of: :vote
  enum role: { admin: 0, voter: 1, candidate: 2 }

  validates :cnic, uniqueness: true, presence: true
  validates :cnic, length: { is: 13 }, if: :cnic_changed?
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :picture, content_type: %i[png jpg jpeg]

  def candidate_constituencies
    Constituency.joins(:candidateships).where(candidateships: { status: Candidateship.statuses['accepted'] })
  end

  def self.candidate_name(cand_id)
    find(cand_id).name
  end

  def applied_constituencies(poll_id)
    Constituency.joins(:candidateships).where(candidateships: { polling_id: poll_id })
  end
end
