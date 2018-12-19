# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :author_id, null: false
      t.timestamps
    end
  end
end
