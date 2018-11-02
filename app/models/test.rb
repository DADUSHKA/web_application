class Test < ApplicationRecord

  scope :tests_of_certain_categories, ->(category_name) do
    joins(:category).where(categories: { title: category_name })
    .order(created_at: :desc)
  end
  scope :list_of_tests_by_difficulty, ->(value) { where(tests: { level: value }) }
  scope :simple_tests, -> { where(level: 0..1) }
  scope :medium_tests, -> { where(level: 2..4) }
  scope :complicated_tests, -> { where(level: 5..1/0.0) }

  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: { scope: :level }
  validates :level, presence: true, numericality: { only_integer: true }

end
