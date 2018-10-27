class Test < ApplicationRecord

  has_and_belongs_to_many :users
  belongs_to :category

  def self.tests_of_certain_categories(category_name)
    joins(:category).where(categories: { title: category_name }).pluck(:title)
  end

end
