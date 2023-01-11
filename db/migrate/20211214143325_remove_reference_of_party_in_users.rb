# frozen_string_literal: true

class RemoveReferenceOfPartyInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :party, foreign_key: true
  end
end
