# frozen_string_literal: true

class AddForeignkeysInSchema < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :candidateships, :parties
    add_foreign_key :candidateships, :users
    add_foreign_key :users, :constituencies
    add_foreign_key :votes, :constituencies
  end
end
