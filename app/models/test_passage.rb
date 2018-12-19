# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_number_question
  before_update :before_update_next_question

  def completed?
    question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def number_question_next
    question.id - before_validation_number_question
  end

  private

  def before_validation_set_first_question
    self.question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    question.answers.correct
  end

  def before_update_next_question
    self.question = test.questions.order(:id).where('id > ?', question.id).first
  end

  def before_validation_number_question
    question_namber = test.questions.first.id
    question_namber - 1
  end
end
