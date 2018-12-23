# frozen_string_literal: true

class Question < ApplicationRecord

  scope :column_id, -> { select(:id) }

  has_many :answers
  belongs_to :test

  validates :description, presence: true, length: { maximum: 250 }
end
