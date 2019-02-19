class CreateTrophiesUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :trophies, :users do |t|
      t.index [:trophy_id, :user_id]
      # t.index [:user_id, :trophy_id]
    end
  end
end
