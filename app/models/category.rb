class Category < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: true
end
