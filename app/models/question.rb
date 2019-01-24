class Question < ApplicationRecord
  scope :test_questions, -> { all }
  scope :get_object, ->(title) { find_by(description: title) }

  has_many :answers, dependent: :delete_all
  belongs_to :test
  has_many :gist

  validates :description, presence: true, length: { maximum: 250 }
end
