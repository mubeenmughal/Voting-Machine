# frozen_string_literal: true

class AddcadidateAndVoterReferenceInVotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :candidate, foreign_key: { to_table: :users }
    remove_column :votes, :user_id, :integer
    add_reference :votes, :voter, foreign_key: { to_table: :users }
  end
end
