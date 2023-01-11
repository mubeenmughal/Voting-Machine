# frozen_string_literal: true

class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :name, null: false
      t.string :symbol
      t.timestamps
    end
  end
end
