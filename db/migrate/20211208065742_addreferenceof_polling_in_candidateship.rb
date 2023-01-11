# frozen_string_literal: true

class AddreferenceofPollingInCandidateship < ActiveRecord::Migration[5.2]
  def change
    add_reference :candidateships, :polling, index: true, foreign_key: true
  end
end
