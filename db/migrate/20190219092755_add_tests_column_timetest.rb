class AddTestsColumnTimetest < ActiveRecord::Migration[5.2]
  def change
     add_column :tests, :time_test, :integer
  end
end
