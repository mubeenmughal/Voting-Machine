# frozen_string_literal: true

class AddDefaultInRolesUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :role, from: nil, to: 1
  end
end
