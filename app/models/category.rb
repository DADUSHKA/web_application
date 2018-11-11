class Category < ApplicationRecord

  default_scope { order(created_at: :desc) }
  scope :category_on_test, ->(test_title) { find(test_title) }

  has_many :tests

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: true

end
