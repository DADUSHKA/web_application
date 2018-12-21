# frozen_string_literal: true

class Question < ApplicationRecord
  scope :answers_correct, -> { includes(:answers).where(answers: { correct: true }) }

  has_many :answers
  belongs_to :test

  validates :description, presence: true, length: { maximum: 250 }
end
