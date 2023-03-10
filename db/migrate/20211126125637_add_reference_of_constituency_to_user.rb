# frozen_string_literal: true

class AddReferenceOfConstituencyToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :constituency, index: true
  end
end
