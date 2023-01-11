# frozen_string_literal: true

class AddreferenceofPollinginVote < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :polling, index: true, foreign_key: true
  end
end
