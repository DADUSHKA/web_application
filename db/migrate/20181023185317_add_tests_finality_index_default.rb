class AddTestsFinalityIndexDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :finality, from: false, to: true
  end
end
