class CreateTrophies < ActiveRecord::Migration[5.2]
  def change
    create_table :trophies do |t|
      t.string :title
      t.string :image
      t.string :precept

      t.timestamps
    end
  end
end
