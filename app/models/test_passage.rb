# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, class_name: 'Question', optional: true

  before_validation :before_validation_set_and_next_question

  def completed?
    question.nil?
  end

  @@user_count_answers_correct = 0
  def accept!(answer_ids)
    @@user_count_answers_correct += answer_ids.count if answer_ids.present?
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def reset_user_count_answers_correct
    @@user_count_answers_correct = 0
  end

  def success_rate
    all_count_answers_correct = 0
    test.questions.each do |i|
      all_count_answers_correct += i.answers.correct.count
    end
    ((100.0 / all_count_answers_correct) * @@user_count_answers_correct).to_i
  end

  @@indicator = 0
  def indicator_number_question
    @@indicator += 1
  end

  def reset_indicator_number_question
    @@indicator = 0
  end

  private

  def before_validation_set_and_next_question
    if question_id != nil
      self.question = test.questions.order(:id).where('id > ?', question.id).first
    else
      self.question = test.questions.first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
      # @@user_count_answers_correct += answer_ids.count
  end

  def correct_answers
    question.answers.correct
  end

end
