# frozen_string_literal: true

class AddDefaultInStatusCandidateship < ActiveRecord::Migration[5.2]
  def change
    change_column_default :candidateships, :status, from: nil, to: 0
  end
end
