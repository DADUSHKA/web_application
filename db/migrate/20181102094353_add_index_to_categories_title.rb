# frozen_string_literal: true

class AddIndexToCategoriesTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :title, unique: true
  end
end
