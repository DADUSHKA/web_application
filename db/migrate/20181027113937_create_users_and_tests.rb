class CreateUsersAndTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests_users, id: false do |t|
       t.integer :user_id
       t.integer :test_id
    end
  end
end

