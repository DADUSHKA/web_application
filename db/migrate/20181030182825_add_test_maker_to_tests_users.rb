class AddTestMakerToTestsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tests_users, :finality, :boolean, default: true
  end
end
