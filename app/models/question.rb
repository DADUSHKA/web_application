class Question < ApplicationRecord
  scope :test_questions, -> { all }
  scope :object, ->(title) { find_by(description: title) }

  has_many :answers, dependent: :delete_all
  belongs_to :test

  validates :description, presence: true, length: { maximum: 250 }
end
