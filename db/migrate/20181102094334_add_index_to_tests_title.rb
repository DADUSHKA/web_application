class AddIndexToTestsTitle < ActiveRecord::Migration[5.2]
  def change
     add_index :tests, :title, unique: true
  end
end
