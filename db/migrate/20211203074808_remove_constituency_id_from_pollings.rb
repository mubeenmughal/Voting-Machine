# frozen_string_literal: true

class RemoveConstituencyIdFromPollings < ActiveRecord::Migration[5.2]
  def change
    remove_column :pollings, :constituency_id, :integer
  end
end
