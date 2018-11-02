class Category < ApplicationRecord

  default_scope { select(:title).order(created_at: :desc) }

  has_many :tests

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: true

end
