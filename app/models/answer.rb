class Answer < ApplicationRecord
  scope :correct, -> { where(correct: true) }

  belongs_to :question

  validate :count_answers_on_question

  private

  def count_answers_on_question
    if question.answers.count >= 4
      errors.add(:base, 'One Question can have from 1 to 4 answers.')
    end
  end
end
