# frozen_string_literal: true

class CreatePolling < ActiveRecord::Migration[5.2]
  def change
    create_table :pollings do |t|
      t.belongs_to :constituency
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
