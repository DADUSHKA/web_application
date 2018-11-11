class Question < ApplicationRecord

  scope :by_test, ->(test_name) do
    joins(:test).where(tests: { title: test_name })
    .order(created_at: :desc)
  end

  has_many :answers
  belongs_to :test

  validates :description, presence: true, length: { maximum: 250 }

end
