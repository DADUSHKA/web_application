class AddTestMakerToTestsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tests_users, :test_autor, :integer
  end
end
