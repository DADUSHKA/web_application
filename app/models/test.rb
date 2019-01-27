class Test < ApplicationRecord
  scope :by_category, lambda { |category_name|
    joins(:category).where(categories: { title: category_name })
  }
  scope :by_level, ->(number) { where(level: number) }
  scope :simple_tests, -> { by_level(0..1) }
  scope :medium_tests, -> { by_level(2..4) }
  scope :complicated_tests, -> { by_level(5..1 / 0.0) }

  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: { scope: :level }
  validates :level, presence: true, numericality: { only_integer: true }
end
