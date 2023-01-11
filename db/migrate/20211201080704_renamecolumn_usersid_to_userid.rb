# frozen_string_literal: true

class RenamecolumnUsersidToUserid < ActiveRecord::Migration[5.2]
  def change
    rename_column :candidateships, :users_id, :user_id
  end
end
