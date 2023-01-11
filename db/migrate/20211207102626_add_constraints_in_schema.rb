# frozen_string_literal: true

class AddConstraintsInSchema < ActiveRecord::Migration[5.2]
  def change
    change_column_null :candidateships, :status, false
    change_column_null :constituencies, :name, false
    change_column_null :pollings, :start_time, false
    change_column_null :pollings, :end_time, false
  end
end
