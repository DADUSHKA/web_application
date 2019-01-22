class Question < ApplicationRecord
  scope :test_questions, -> { all }

  has_many :answers, dependent: :delete_all
  belongs_to :test

  validates :description, presence: true, length: { maximum: 250 }
end
