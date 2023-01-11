# frozen_string_literal: true

class AddCompositeIndexOnVoterId < ActiveRecord::Migration[5.2]
  def change
    add_index :votes, %i[voter_id polling_id constituency_id], unique: true
  end
end
