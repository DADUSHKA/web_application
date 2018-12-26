# frozen_string_literal: true

class RemoveCategoryFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :category, :datatype
  end
end
