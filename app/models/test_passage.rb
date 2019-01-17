class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, optional: true

  before_validation :before_validation_set_and_next_question

  def completed?
    question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def success_rate
    ((correct_questions.to_f / test.questions.count) * 100).to_i
  end

  def indicator_number_question(test_passage)
    test_passage.test.questions.test_questions.order(id: :asc).index(question) + 1
  end

  private

  def before_validation_set_and_next_question
    self.question =
      if !question_id.nil?
        test.questions.order(:id).where('id > ?', question.id).first
      else
        test.questions.first
      end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    question.answers.correct
  end
end
