class Test < ApplicationRecord

  scope :question_header, ->(instance_id) { find(instance_id) }
  scope :by_category, ->(category_name) do
    joins(:category).where(categories: { title: category_name })
    .order(created_at: :desc)
  end
  scope :by_level, ->(number) { where(level: number) }
  scope :simple_tests, -> { by_level(0..1) }
  scope :medium_tests, -> { by_level(2..4) }
  scope :complicated_tests, -> { by_level(5..1/0.0) }

  has_many :questions, dependent: :delete_all
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: { scope: :level }
  validates :level, presence: true, numericality: { only_integer: true }

end
