class Test < ApplicationRecord

  has_many :questions
  has_many :user, through: :questions
  belongs_to :category

  def self.tests_of_certain_categories(category_name)
    joins(:category).where(categories: { title: category_name }).pluck(:title)
  end
end
