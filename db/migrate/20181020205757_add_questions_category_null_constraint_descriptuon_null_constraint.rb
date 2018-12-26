# frozen_string_literal: true

class AddQuestionsCategoryNullConstraintDescriptuonNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :questions, :description, false
  end
end
