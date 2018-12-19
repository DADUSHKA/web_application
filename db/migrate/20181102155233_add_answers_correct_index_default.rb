# frozen_string_literal: true

class AddAnswersCorrectIndexDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :answers, :correct, from: true, to: false
  end
end
