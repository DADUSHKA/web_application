# frozen_string_literal: true

class AddTestRefToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :test, foreign_key: true
  end
end
