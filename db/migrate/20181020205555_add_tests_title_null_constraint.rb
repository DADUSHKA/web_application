# frozen_string_literal: true

class AddTestsTitleNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tests, :title, false
    change_column_null :tests, :author_id, false
  end
end
