# frozen_string_literal: true

class CreateConstituency < ActiveRecord::Migration[5.2]
  def change
    create_table :constituencies do |t|
      t.string :name
      t.timestamps
    end
  end
end
