class Question < ApplicationRecord

  has_many :answers
  belongs_to :test

  validate :validate_count_answers

  private

  def validate_count_answers
    if answers.count > 4
      errors.add(:base, "One Question can have from 1 to 4 answers.")
    end
  end

end
