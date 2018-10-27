class ChangeColumnTests < ActiveRecord::Migration[5.2]
  def change
    rename_column :tests, :status, :finality
  end
end
