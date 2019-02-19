class AddTestsTimetestIntegerDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :time_test, 0
  end
end
