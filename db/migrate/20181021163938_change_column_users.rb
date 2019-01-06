# frozen_string_literal: true

class ChangeColumnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :status, :admin_status
  end
end
