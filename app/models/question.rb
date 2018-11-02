class Question < ApplicationRecord

  has_many :answers, -> { limit(1..4) }, class_name: "Answer"
  belongs_to :test

end
