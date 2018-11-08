class Question < ApplicationRecord

  has_many :answers
  belongs_to :test

  validates :description, presence: true, length: { maximum: 250 }

end
