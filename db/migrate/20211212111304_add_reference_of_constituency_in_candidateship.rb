# frozen_string_literal: true

class AddReferenceOfConstituencyInCandidateship < ActiveRecord::Migration[5.2]
  def change
    add_reference :candidateships, :constituency, foreign_key: true, index: true
  end
end
