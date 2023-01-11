# frozen_string_literal: true

class ChangeStringToIntegerOfRoleInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, 'integer USING CAST(role AS integer)'
  end
end
