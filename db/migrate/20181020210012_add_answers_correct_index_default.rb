class AddAnswersCorrectIndexDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :answers, :correct, from: false, to: true
  end
end
