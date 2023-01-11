# frozen_string_literal: true

class CreateVote < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :constituency
      t.timestamps
    end
  end
end
