# frozen_string_literal: true

class AddReferenceOfPartyInCandidateship < ActiveRecord::Migration[5.2]
  def change
    add_reference :candidateships, :party, index: true
  end
end
