# frozen_string_literal: true

class CreateApplication < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :status
      t.belongs_to :users
      t.timestamps
    end
  end
end
