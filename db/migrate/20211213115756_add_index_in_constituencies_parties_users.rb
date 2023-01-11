# frozen_string_literal: true

class AddIndexInConstituenciesPartiesUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :cnic, unique: true
    add_index :parties, :name, unique: true
    add_index :constituencies, :name, unique: true
  end
end
