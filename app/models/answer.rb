class Answer < ApplicationRecord

  scope :right_answers, -> { where(correct: true) }

  belongs_to :question

end
