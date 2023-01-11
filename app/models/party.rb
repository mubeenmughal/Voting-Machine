# frozen_string_literal: true

class Party < ApplicationRecord
  has_one_attached :symbol
  has_many :candidateships, dependent: :destroy

  validates :symbol, content_type: %i[png jpg jpeg]
  validates :name, uniqueness: true, presence: true
end
