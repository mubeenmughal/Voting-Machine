# frozen_string_literal: true

class RenameApplicationToNewCandidateship < ActiveRecord::Migration[5.2]
  def change
    rename_table :applications, :candidateships
  end
end
