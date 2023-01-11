# frozen_string_literal: true

class CreateUsersconstituencies < ActiveRecord::Migration[5.2]
  def change
    create_table :usersconstituencies do |t|
      t.belongs_to :candidate, foreign_key: { to_table: :users }
      t.belongs_to :candidconstituency, foreign_key: { to_table: :constituencies }
      t.timestamps
    end
  end
end
